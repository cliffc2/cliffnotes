#!/bin/sh

# Disclaimer:
#
#  The following use of shell script is for demonstration and understanding
#  only. It should *NOT* be used at scale or for any sort of serious
#  deployment, and is solely used for learning how the node and blockchain
#  works, and how to interact with everything.
#
#  It also asumes that `jcli` is in the same folder with the script.
#  The script works only for Account address types.
#
#  Tutorials can be found here: https://github.com/input-output-hk/shelley-testnet/wiki

### CONFIGURATION
CLI="./jcli"
COLORS=1
ADDRTYPE="--testing"
SLOT_DURATION=2
TIMEOUT_NO_OF_BLOCKS=200

getTip() {
  echo $($CLI rest v0 tip get -h "${REST_URL}")
}

waitNewBlockCreated() {
  COUNTER=${TIMEOUT_NO_OF_BLOCKS}
  echo "  ##Waiting for new block to be created (timeout = ${COUNTER} blocks = $((${COUNTER}*${SLOT_DURATION})) secs)."
  initialTip=$(getTip)
  actualTip=$(getTip)

  while [ "${actualTip}" = "${initialTip}" ]; do
    echo -ne '  ##Waiting...\r'
    sleep ${SLOT_DURATION}
    echo -ne '              \r'
    actualTip=$(getTip)
    COUNTER=$((COUNTER - 1))
    if [ ${COUNTER} -lt 2 ]; then
      echo "  !!!!!! ERROR: Waited $((${TIMEOUT_NO_OF_BLOCKS} * ${SLOT_DURATION})) secs (${TIMEOUT_NO_OF_BLOCKS} blocks * ${SLOT_DURATION} seconds slot duration) and no new block was created."
      echo "  The transaction may still be included when a block is finally created."
      exit 1
    fi
  done
  echo "New block was created - $(getTip)"
}

### COLORS
if [ ${COLORS} -eq 1 ]; then
  GREEN=$(printf "\033[0;32m")
  RED=$(printf "\033[0;31m")
  BLUE=$(printf "\033[0;33m")
  WHITE=$(printf "\033[0m")
else
  GREEN=""
  RED=""
  BLUE=""
  WHITE=""
fi

if [ $# -ne 4 ]; then
  echo "usage: $0 <ADDRESS> <AMOUNT> <REST-LISTEN-PORT> <SOURCE-SK>"
  echo "    <ADDRESS>     Address where to send the funds"
  echo "    <AMOUNT>      Amount to be sent (in lovelace) - tx fees will be paid by the source address"
  echo "    <REST-LISTEN-PORT>   The REST Listen Port set in node-config.yaml file (EX: 3101)"
  echo "    <SOURCE-SK>   The Secret key of the Source address"
  exit 1
fi

DESTINATION_ADDRESS="$1"
DESTINATION_AMOUNT="$2"
REST_PORT="$3"
SOURCE_SK="$4"

REST_URL="http://127.0.0.1:${REST_PORT}/api"
BLOCK0_HASH=$($CLI rest v0 settings get -h "${REST_URL}" | grep 'block0Hash:' | sed -e 's/^[[:space:]]*//' | sed -e 's/block0Hash: //')
FEE_CONSTANT=$($CLI rest v0 settings get -h "${REST_URL}" | grep 'constant:' | sed -e 's/^[[:space:]]*//' | sed -e 's/constant: //')
FEE_COEFFICIENT=$($CLI rest v0 settings get -h "${REST_URL}" | grep 'coefficient:' | sed -e 's/^[[:space:]]*//' | sed -e 's/coefficient: //')

echo "================Send Money================="
echo "DESTINATION_ADDRESS: ${DESTINATION_ADDRESS}"
echo "DESTINATION_AMOUNT: ${DESTINATION_AMOUNT}"
echo "REST_PORT: ${REST_PORT}"
echo "SOURCE_SK: ${SOURCE_SK}"
echo "BLOCK0_HASH: ${BLOCK0_HASH}"
echo "FEE_CONSTANT: ${FEE_CONSTANT}"
echo "FEE_COEFFICIENT: ${FEE_COEFFICIENT}"
echo "=================================================="

STAGING_FILE="staging.$$.transaction"

#CLI transaction
if [ -f "${STAGING_FILE}" ]; then
  echo "error: staging already exist. restart"
  exit 2
fi

set -e

SOURCE_PK=$(echo ${SOURCE_SK} | $CLI key to-public)
SOURCE_ADDR=$($CLI address account ${ADDRTYPE} ${SOURCE_PK})

echo "## Sending ${RED}${DESTINATION_AMOUNT}${WHITE} to ${BLUE}${DESTINATION_ADDRESS}${WHITE}"
$CLI address info "${DESTINATION_ADDRESS}"

# TODO we should do this in one call to increase the atomicity, but otherwise
SOURCE_COUNTER=$($CLI rest v0 account get "${SOURCE_ADDR}" -h "${REST_URL}" | grep '^counter:' | sed -e 's/counter: //')

# the source account is going to pay for the fee ... so calculate how much
# FEE_COEFFICIENT should be multiplied witht the no of (INPUTS + OUTPUTS) - we use only 1 Source and 1 Destination
ACCOUNT_AMOUNT=$((${DESTINATION_AMOUNT} + ${FEE_CONSTANT} + $((2 * ${FEE_COEFFICIENT}))))

# Create the transaction
# FROM: ACCOUNT for AMOUNT+FEES
# TO: DESTINATION ADDRESS for AMOUNT
echo " ##1. Create the offline transaction file"
$CLI transaction new --staging ${STAGING_FILE}

echo " ##2. Add input details"
$CLI transaction add-account "${SOURCE_ADDR}" "${ACCOUNT_AMOUNT}" --staging "${STAGING_FILE}"

echo " ##3. Add output details"
$CLI transaction add-output "${DESTINATION_ADDRESS}" "${DESTINATION_AMOUNT}" --staging "${STAGING_FILE}"

echo " ##4. Finalize the transactions"
$CLI transaction finalize --staging ${STAGING_FILE}

TRANSACTION_ID=$($CLI transaction id --staging ${STAGING_FILE})

echo " ##5. Create the witness"
# Create the witness for the 1 input (add-account) and add it
WITNESS_SECRET_FILE="witness.secret.$$"
WITNESS_OUTPUT_FILE="witness.out.$$"

printf "${SOURCE_SK}" >${WITNESS_SECRET_FILE}

$CLI transaction make-witness ${TRANSACTION_ID} \
  --genesis-block-hash ${BLOCK0_HASH} \
  --type "account" --account-spending-counter "${SOURCE_COUNTER}" \
  ${WITNESS_OUTPUT_FILE} ${WITNESS_SECRET_FILE}

echo " ##6. Add the witness to the transaction"
$CLI transaction add-witness ${WITNESS_OUTPUT_FILE} --staging "${STAGING_FILE}"

echo " ##7. Show the transaction info"
$CLI transaction info --fee-constant ${FEE_CONSTANT} --fee-coefficient ${FEE_COEFFICIENT} --staging "${STAGING_FILE}"

echo " ##8. Finalize the transaction and send it"
$CLI transaction seal --staging "${STAGING_FILE}"
$CLI transaction to-message --staging "${STAGING_FILE}" | $CLI rest v0 message post -h "${REST_URL}"

echo " ##9. Remove the temporary files"
rm ${STAGING_FILE} ${WITNESS_SECRET_FILE} ${WITNESS_OUTPUT_FILE}

waitNewBlockCreated

echo " ##10. Check the account's balance"
$CLI rest v0 account get ${DESTINATION_ADDRESS} -h ${REST_URL}

exit 0
