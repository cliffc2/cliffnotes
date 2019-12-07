# Shelley Testnet command list on OSX
>Dec 8, 2019 - The code is changing daily so check the telegram group for updates. References to other guides are below. Check out Chris Graffagnino's notes too. https://gist.github.com/Chris-Graffagnino/4d1be0b88dcaa93440a81dcafdc47afd#create-node-configyaml

TO LOAD JORMUNGANDR FROM THE BINARIES GO HERE 

https://github.com/input-output-hk/jormungandr/releases/ 

After you load the binaries, you will need to make a 2 folders (jormungandr folder and a tmp/jormungandr "storage" folder) then create the config.yaml (or node-config.yaml then save the file to the jormungandr folder).

Real-time stakepool map (global)
https://input-output-hk.github.io/shelley-node-map/

Jormungandr Overall Block Aggregate:
https://gist.github.com/disassembler/8bf31cb82dc3a854da1552f07540976e

# Genesis block hash for 0.8.0-rc9+ nightly (Updated 12/8/19)
```c8a1b4b8cd3b6a6c39adba11f62c34230b37b388f5a8edfe8cd73e7b8f811f48```


NOTE - 0.8.0 rc9+1 nightly is using ```jormungandr --genesis-block-hash 65a9b15f82619fffd5a7571fdbf973a18480e9acf1d2fddeb606ebb53ecca839 --config nightly-config.yaml ``` 

NOTE - 0.8.0 rc7 nightly is using ```jormungandr --genesis-block-hash c8a1b4b8cd3b6a6c39adba11f62c34230b37b388f5a8edfe8cd73e7b8f811f48 --config nightly-config.yaml ``` 

NOTE - 0.7.0 beta is using ```jormungandr --genesis-block-hash 27668e95121566df0bb2e2c11c5fd95dfe59efd570f8f592235ecff167ca3f29 --config config.yaml ``` 

OLD NOTE - 0.8.0 rc1 beta is using ```jormungandr --genesis-block-hash 27668e95121566df0bb2e2c11c5fd95dfe59efd570f8f592235ecff167ca3f29 --config config.yaml ``` 

Check the recent IOHK builds (config and genesis block info).
https://hydra.iohk.io/job/Cardano/jormungandr/jormungandrConfigs.beta/latest
for the nightly go to the hydra site and use the search term nightly (look for the linux distribution)


| Steps (for binaries install) | Type these commands into the OSX computer Terminal (computer_name:~ account$) or create the folders in your finder | Output example |
| ------------- | ------------- | -------------  |
| Make a folder to store the jormungandr and program |   ```mkdir -p ~/jormungandr```      |   this is where you find your jormungandr program    |
| Make a folder to store the temporary blockchain (database)|   ```mkdir -p ~/tmp/jomungandr```      |   this path needs to be in your config.yaml (see below)     |
| Check your ip address (public) this goes into your "node" config.yaml | [What is my IP address](https://www.whatismyip.com/) | 143.0.173.9 |
| Configure the node |  Open (or create) config.yaml   |  See the example node-config.yaml below or [IOHK reference]((https://input-output-hk.github.io/jormungandr/quickstart/02_passive_node.html)) |

>Example config.yaml file (you need to make this to connect to other machines. change the public address check your ip address; use [ifconfig.me](ifconfig.me) and check the ports (like an telephone extension number) i.e. 3101, storage folder location needs to match also.)



Config for 0.8.0 rc9+1 nightly
```
{
  "log": [
    {
      "format": "plain",
      "level": "info",
      "output": "stderr"
    }
  ],
  "p2p": {
    "topics_of_interest": {
      "blocks": "normal",
      "messages": "low"
    },
    "trusted_peers": [
      {
        "address": "/ip4/13.230.137.72/tcp/3000",
        "id": "fe3332044877b2034c8632a08f08ee47f3fbea6c64165b3b"
      },
      {
        "address": "/ip4/13.230.48.191/tcp/3000",
        "id": "c38aabb936944776ef15bbe4b5b02454c46a8a80d871f873"
      },
      {
        "address": "/ip4/18.196.168.220/tcp/3000",
        "id": "7e2222179e4f3622b31037ede70949d232536fdc244ca3d9"
      },
      {
        "address": "/ip4/3.124.132.123/tcp/3000",
        "id": "9085fa5caeb39eace748a7613438bd2a62c8c8ee00040b71"
      },
      {
        "address": "/ip4/18.184.181.30/tcp/3000",
        "id": "f131b71d65c49116f3c23c8f1dd7ceaa98f5962979133404"
      },
      {
        "address": "/ip4/184.169.162.15/tcp/3000",
        "id": "fdb88d08c7c759b5d30e854492cb96f8203c2d875f6f3e00"
      },
      {
        "address": "/ip4/52.52.67.33/tcp/3000",
        "id": "3d1f8891bf53eb2946a18fb46cf99309649f0163b4f71b34"
      }
    ]
  },
  "rest": {
    "listen": "127.0.0.1:3100"
  },
  "storage": "tmp/jormungandr080rc91"
}
```


``` 
#CONFIG FOR  0.8.0 RC7
{
  "log": [
    {
      "format": "plain",
      "level": "info",
      "output": "stderr"
    }
  ],
  "p2p": {
    "topics_of_interest": {
      "blocks": "normal",
      "messages": "low"
    },
    "trusted_peers": [
      {
        "address": "/ip4/13.230.137.72/tcp/3000",
        "id": "fe3332044877b2034c8632a08f08ee47f3fbea6c64165b3b"
      },
      {
        "address": "/ip4/13.230.48.191/tcp/3000",
        "id": "c38aabb936944776ef15bbe4b5b02454c46a8a80d871f873"
      },
      {
        "address": "/ip4/18.196.168.220/tcp/3000",
        "id": "7e2222179e4f3622b31037ede70949d232536fdc244ca3d9"
      },
      {
        "address": "/ip4/3.124.132.123/tcp/3000",
        "id": "9085fa5caeb39eace748a7613438bd2a62c8c8ee00040b71"
      },
      {
        "address": "/ip4/18.184.181.30/tcp/3000",
        "id": "f131b71d65c49116f3c23c8f1dd7ceaa98f5962979133404"
      },
      {
        "address": "/ip4/184.169.162.15/tcp/3000",
        "id": "fdb88d08c7c759b5d30e854492cb96f8203c2d875f6f3e00"
      },
      {
        "address": "/ip4/52.52.67.33/tcp/3000",
        "id": "3d1f8891bf53eb2946a18fb46cf99309649f0163b4f71b34"
      }
    ]
  },
  "rest": {
    "listen": "127.0.0.1:3100"
  },
  "storage": "/tmp/jormungandr"
}


```

``` 
#config.yaml for 0.7.3 beta nov 27th and 0.8.0 rc1 nov 29th
log:
- output: stderr
  format: plain
  level: info
p2p:
  topics_of_interest:
    blocks: normal
    messages: low
  trusted_peers:
  - address: "/ip4/52.9.85.113/tcp/3000"
    id: 7f47c880339670ad98d38ad3b379e1f7853479f8ef4f6fc7
  - address: "/ip4/13.57.72.175/tcp/3000"
    id: b8b20f58b34dd7a485c8cff0d67f800149b1ff220b826632
  - address: "/ip4/52.8.62.219/tcp/3000"
    id: f51aa0ce82b7f061e12762bd22b84424129f690655441b8e
  - address: "/ip4/52.194.124.233/tcp/3000"
    id: 255df5de725cd9d1087b8a3e4ff66d65572c36ceed791679
  - address: "/ip4/52.197.220.18/tcp/3000"
    id: 50768a0bb41781baa551cd96fb46a62e666e97874bca1cf5
  - address: "/ip4/3.125.20.154/tcp/3000"
    id: ddfea960bc2fe1aa45af9b385b6bd3e949c050df61b5b451
  - address: "/ip4/3.124.255.35/tcp/3000"
    id: 2b7216b51b890ef1e8ade8e513dd6f2b35173e46b08ac1a9
rest:
  listen: 127.0.0.1:<YOUR REST PORT>
storage: "/tmp/jormungandr"
```

> For reference
```
#config.yaml for 0.7.0 beta nov 20th - example format (dec 8 - worked)

{
  "log": {
    "format": "plain",
    "level": "info",
    "output": "stderr"
  },
  "p2p": {
    "topics_of_interest": {
      "blocks": "normal",
      "messages": "low"
    },
    "trusted_peers": [
      {
        "address": "/ip4/13.230.137.72/tcp/3000",
        "id": "e4fda5a674f0838b64cacf6d22bbae38594d7903aba2226f"
      },
      {
        "address": "/ip4/13.230.48.191/tcp/3000",
        "id": "c32e4e7b9e6541ce124a4bd7a990753df4183ed65ac59e34"
      },
      {
        "address": "/ip4/18.196.168.220/tcp/3000",
        "id": "74a9949645cdb06d0358da127e897cbb0a7b92a1d9db8e70"
      },
      {
        "address": "/ip4/3.124.132.123/tcp/3000",
        "id": "431214988b71f3da55a342977fea1f3d8cba460d031a839c"
      },
      {
        "address": "/ip4/18.184.181.30/tcp/3000",
        "id": "e9cf7b29019e30d01a658abd32403db85269fe907819949d"
      },
      {
        "address": "/ip4/184.169.162.15/tcp/3000",
        "id": "acaba9c8c4d8ca68ac8bad5fe9bd3a1ae8de13816f40697c"
      },
      {
        "address": "/ip4/13.56.87.134/tcp/3000",
        "id": "bcfc82c9660e28d4dcb4d1c8a390350b18d04496c2ac8474"
      }
    ]
  },
  "rest": {
    "listen": "127.0.0.1:3100"
  }
}


```
Below is 070rc7 node-config.yaml it has been depreciated - it is here for reference
```
log:
 format: plain
 level: info
 output: stderr
p2p:
 listen_address: /ip4/0.0.0.0/tcp/9000
 public_address: /ip4/x.x.x.x/tcp/9000 #you need to change this ip address - get it from www.ifconfig.me website
 topics_of_interest:
    blocks: high
    messages: high
 trusted_peers:
   - address: "/ip4/13.230.137.72/tcp/3000"
     id: e4fda5a674f0838b64cacf6d22bbae38594d7903aba2226f
   - address: "/ip4/18.196.168.220/tcp/3000"
     id: 74a9949645cdb06d0358da127e897cbb0a7b92a1d9db8e70
   - address: "/ip4/3.124.132.123/tcp/3000"
     id: 431214988b71f3da55a342977fea1f3d8cba460d031a839c
   - address: "/ip4/18.184.181.30/tcp/3000"
     id: e9cf7b29019e30d01a658abd32403db85269fe907819949d
   - address: "/ip4/13.230.48.191/tcp/3000"
     id: c32e4e7b9e6541ce124a4bd7a990753df4183ed65ac59e34
   - address: "/ip4/184.169.162.15/tcp/3000"
     id: acaba9c8c4d8ca68ac8bad5fe9bd3a1ae8de13816f40697c
   - address: "/ip4/13.56.87.134/tcp/3000"
     id: bcfc82c9660e28d4dcb4d1c8a390350b18d04496c2ac8474
rest:
 listen: 127.0.0.1:3101  #you need to check this port when using jcli command
storage: "temp/storage" #you need to check this location and match correct names
explorer:
 enabled: false
mempool:
  fragment_ttl: 30m
  log_ttl: 30m
  garbage_collection_interval: 30m
leadership:
  log_ttl: 30m
  garbage_collection_interval: 30m 

 ```


>Troubleshooting note: If you have problems, check your path to make sure jormungandr can find the config.yaml (should be in the jormangandr folder). Also check your ports to make sure they are pointing to the right number. i.e. when you run ```jcli rest v0 node stats get -h http://127.0.0.1:3100/api ``` but if the port is 3101 or some other number you will get an error. 



| Next steps (mostly in order) | Type these commands into the OSX computer Terminal (computer_name:~ account$) | Output example |
| ------------- | ------------- | -------------  |
|Start (run) Jormungandr Node 0.7.3|```jormungandr --genesis-block-hash 27668e95121566df0bb2e2c11c5fd95dfe59efd570f8f592235ecff167ca3f29 --config config.yaml ```||
| Skip this Reference 0.7.0b | ```jormungandr --genesis-block-hash dceef4d6696ead83eadb5104c6383e1905aa81fc7a79ea2ca87a97c2bfd2f4a1 --config config.yaml ``` (note: you need to use the new hash to connect to the testnet chain.  Do not use --genesis-block block-0.bin to start the node. That is a self-node.) | Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init  |
| Open a new command line terminal | Terminal > shell > new window (or command + N)| new terminal opens  |
| Check the node is in 'sync' | ```jcli rest v0 node stats get -h http://127.0.0.1:3100/api``` | blockRecvCnt:234-lastBlockDate: "217.22760"-lastBlockFees:    |
| Check your fee settings  | ```jcli rest v0 settings get -h http://127.0.0.1:3100/api``` | block0Hash: adbdd5ede31637-block0Time: "2019-02-22T07:53:34+00:00 |
| Check the node statistics compare with jcli rest command|```curl http://127.0.0.1:3100/api/v0/node/stats```|blockRecvCnt:2923-lastBlockDate: "217.22760"-lastBlockFees:|
| You can also check from your browser. (check your port)|http://127.0.0.1:3100/api/v0/stake_pools||


Technical support and questions are [welcome here on Telegram.](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwj91KjF9ITlAhWMOnAKHZGiCp0QFjAAegQIARAB&url=https%3A%2F%2Ft.me%2FCardanoStakePoolWorkgroup&usg=AOvVaw2kMgG-ZJbcfxoDS77H893I) And here:
https://iohk.zendesk.com/hc/en-us


THE END OF THE BINARIES LOAD, RUN, AND CHECK NODE STATUS.


#  TO LOAD JORMUNGANDR FROM SOURCE CODE (INTERMEDIATE SKILL LEVEL)

>Jormungandr is written in the [Rust programming language](https://github.com/rust-lang.). 

* To do list (load from source - not for newbies though mostly harmless)
  * load Rust (using rustup command)
  * load jormungandr program (the ring of computers around the globe)
  * load jcli (Jormungandr Command Line Interface - JCLI)
  * load sqlite (if not loaded - for temporary blockchain database)
  * edit port and check ip addresses
  * make folders (for temporary blockchain database)
  * edit node-config.yaml (your computer's IP info)
  * make public keys from secret keys (to receive funds)
  * check node is in 'sync'
  * get tokens from faucet
  * send tokens to another account
  * delegate stake to pool
  * make stake pool keys (4)
  * make stake pool certificate
  * get node id


>  _Open a command line Terminal (Open
the Finder ▸ ⁨look under Applications⁩ ▸ ⁨and click Utilities⁩)_

| Steps (mostly in order) | Type these commands into the OSX computer Terminal (computer_name:~ account$) | Output example |
| ------------- | ------------- | -------------  |
|Download Rust (command linked to website)|[```curl https://sh.rustup.rs -sSf \| sh```](https://www.rust-lang.org/tools/install)|
| Create Rust path | ```source $HOME/.cargo/env``` | loads rustup path to bash_profile |
| Load Rust  | ```rustup install stable``` | info: checking for self-updates |
| Load Default  | ```rustup default stable```  | info: default toolchain set to 'stable-x86_64-apple-darwin' |
| Check the Rust version | ```rustc --version``` | rustc 1.38.0 (625451e37 2019-09-23) |
| Update if old|```rustup update```|
| Check folder path if Rust fails| [```echo $PATH```](https://explainshell.com/explain?cmd=echo+%24PATH)| /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin  |
| Download Jormungandr | ``` git clone --recurse-submodules https://github.com/input-output-hk/jormungandr ```| Cloning into 'jormungandr'remote: Enumerating objects: 110, done --- Submodule path 'chain-deps': checked out   |
| Go to the Jormungandr folder | ```cd jormungandr``` | returns command prompt - macbook-pro:jormungandr cliff$  |
| Load Jormungandr | ```cargo install --path jormungandr```| Installing jormungandr v0.5.5 (/Users/cliff/jormungandr/jormungandr |
|if build fails| load ```xcode-select --install```  | note: **[xcrun: error: invalid active developer path](https://stackoverflow.com/questions/52522565/git-is-not-working-after-macos-update-xcrun-error-invalid-active-developer-pa)** (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun |
| Load jcli | ```cargo install --path jcli```| Installing jcli v0.5.2 (/Users/cliff/jormungandr/jcli)|
| Check the jcli version | ```jcli -V``` | jcli 0.5.X to present |



>Now we will create a new account. [revised IOHK Documentation here](https://iohk.zendesk.com/hc/en-us/categories/360002383814-Shelley-Networked-Testnet)
 There are some [New scripts](https://github.com/input-output-hk/shelley-testnet/tree/master/scripts) if you want to skip the manual account and key making.

|Make an Account by hand|Type these commands into the OSX computer Terminal (computer_name:~ account$)| Output example |
| ------------- | ------------- | -------------  |
|Start (run) Jormungandr Node 0.8.0|```jormungandr --genesis-block-hash 27668e95121566df0bb2e2c11c5fd95dfe59efd570f8f592235ecff167ca3f29 --config config.yaml ```||
| Start (old) Jormungandr Passive Node 0.7.0 | ```jormungandr --genesis-block-hash dceef4d6696ead83eadb5104c6383e1905aa81fc7a79ea2ca87a97c2bfd2f4a1 --config config.yaml ``` (note: you need to use this adbdd....hash to connect to the testnet chain.  Do not use --genesis-block block-0.bin to start the node. That is a self-node.) | Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init  |
| Check the directory | ```ls``` | list of folders |
| Go to the Jormungandr folder | ```cd jormungandr``` | returns command prompt - macbook-pro:~ cliff$  |
|Now we can make keys| note - new key making script here so you can skip to the faucet step. https://github.com/input-output-hk/jormungandr-qa/tree/master/scripts|```createAddress.sh account```|
|skip|Check permissions|```ls -l```|
|skip|Change permissions|```chmod +x createAddress.sh```|
|skip|run script ```createAddress.sh account```|```createAddress.sh account```|
| Make a secret key | ```jcli key generate --type=Ed25519Extended > receiver_secret.key``` | ed25519e_sk1vqsf2dh3rlg2....  |
| Make a public key from the secret key | ```cat receiver_secret.key jcli key to-public > receiver_public.key``` | ed25519_pk1nv4f5.... |
| Make an account address from the public key | ```jcli address account --testing $(cat receiver_public.key) \| tee receiver_account.txt``` | This is your receiver account (account address) ca1s56lu955y... |
| List files and folders in jormungandr | ```ls ``` (You should see receiver_account.txt, receiver_secret.key, receiver_public.key...) | list of all your files and folders |
| FAUCET STEP Go to the IOHK website to get ADA testnet tokens from the faucet| Now we can go get testnet tokens https://testnet.iohkdev.io/en/cardano/shelley/tools/faucet/ | it will give you a transaction number  |
| Check your account address to see your tokens | ```jcli rest v0 account get $(cat receiver_account.txt) -h  http://127.0.0.1:3100/api``` (note: you need to check your node-config.yaml (config.yaml) to see what port (i.e. 3101 or 3100) you are using) | counter: 0 -delegation:pools:[] value: 250000000000 |
| Send tokens to account | Now we can send tokens (money) using a script.  https://github.com/input-output-hk/shelley-testnet/tree/master/scripts ```send-money.sh <ADDRESS> <AMOUNT> <REST-LISTEN-PORT> <SOURCE-SK>``` | |
| Check the message log to see tx |```jcli rest v0 message logs --host "http://127.0.0.1:3100/api```|

>OUTPUT
================Send Money=================
DESTINATION_ADDRESS: ca1sdj6vsyq4qdfrm0t5h4cgftld238lvxc7dp3h5ph5ld89ydlylh659d0q5g
DESTINATION_AMOUNT: 10000
REST_PORT: 3101...

|   | Delegate script |
| ------------- | ------------- |
| Delegate tokens to a Stake pool. | Now we can delegate using a script. https://github.com/input-output-hk/shelley-testnet/tree/master/scripts ``` delegate-account.sh <STAKE_POOL_ID> <REST-LISTEN-PORT> <ACCOUNT-SK> ```Here is the IOHK Zendesk reference https://iohk.zendesk.com/hc/en-us/categories/360002383814-Shelley-Networked-Testnet  |



Check the delegated tokens - TBC


Create a Stake pool (key and cert) by hand
---

|   | OSX Terminal |
| ------------- | ------------- |
| Make a secret vrf key  | ```        jcli key generate --type=Curve25519_2HashDH > stake_pool_vrf.prv         ```  |
| Make a public vrf key from secret vrf key  | ```cat stake_pool_vrf.prv jcli key to-public > stake_pool_vrf.pub```  |
| Make a secret stakepool key from scratch  | ```jcli key generate --type=SumEd25519_12 > stake_pool_kes.prv``` |
| Make a public stakepool key from secret | ```cat stake_pool_kes.prv jcli key to-public > stake_pool_kes.pub``` |









--- 
How to get your stake pool cert (one line command example)
---


```
jcli certificate new stake-pool-registration --kes-key kes25519-12-pk1q06kvadqp040wzc5acnnv06rjqphnavyf9xfgpf6awjnnptqef9jkk --vrf-key vrf_pk1sesgrk2k6e6rxypkcj855fnnwcs9k5zg62yhqklrzshmlj02qysdhxeqy --owner ed25519_pk14pe9kt0kcxqlj7h8g3ye2lt5mjlph0y08l2jg8u6hgwsag830qd708gl --start-validity 0 --management-threshold 1 --serial 1010101010 > stake_pool.cert
```
>This is what is would look like in separated logical command pieces (the computer only sees one line.)

```
jcli certificate new stake-pool-registration 
--kes-key kes25519-12-pk1q06kvadqp040wzc5anv06rjqphnavyf9xfgpf6awjnnptqef9jkk 
--vrf-key vrf_pk1sesgrk2k6e6rxypkcj855fnnwcs9k5zg62yhqklrzshmlj02qysdhxeqy 
--owner ed25519_pk14pe9kt0kcxql7h8g3ye2lt5mjlph0y08l2jg8u6hgwsag830qd708gl 
--start-validity 0 
--management-threshold 1 
--serial 1010101010 > stake_pool.cert
```
>This is the format with indentions (need verification)

jcli certificate new stake-pool-registration \
    --kes-key (stake pool public key) \
    --vrf-key (voting pool public key)  \
    --owner (account public key) \
    --start-validity 0  \
    --management-threshold 1 \
    --serial 1010101010 > stake_pool.cert

    #dec 4th telegram rip
    
    jcli certificate new stake-pool-registration \
    --kes-key $(cat stake_pool_kes.pub) \
    --vrf-key $(cat stake_pool_vrf.pub) \
    --start-validity 0 \
    --management-threshold 1 \
    --tax-fixed 1000000 \
    --tax-limit 1000000000 \
    --tax-ratio "1/10" \
    --owner $(cat owner_key.pub) > stake_pool.cert

---
How to update (get the new) Jormungandr version with git
---

| Git something | OSX Terminal Command |
| ------------- | ------------- |
| Load new version  | ``` git checkout v0.x.x ```  |
| Copy from Github  | ```git pull``` |
| Check submodules  | ```git submodule update --init --recursive```|
| Clean (Optional) |``cargo clean ``|
|Update |``cargo update``|
| Reload Jormungandr old to new | ```cargo install --path jormungandr --force```  |
| Reload jcli old to new |```cargo install --path jcli --force```  |


How to drop all your local changes and commits, fetch the latest history from the server and point your local master branch at it like this
---

| Git something | OSX Terminal Command |
| ------------- | ------------- |
| Load new version  | ``` git fetch origin ```  |
| Reset  | ```git reset --hard origin/master``` |


Other tools and commands
---

| Other commands | OSX Terminal Command |
| ------------- | ------------- |
| Edit your folder paths for bash commands | ```touch ~/.bash_profile; open ~/.bash_profile```  |
| Find your jormungadr folder location  | ```which jormungandr``` |
| Check submodule updates  | ```git submodule update --init --recursive```  |
| Find your sudo folder | ```which sudo```  |
| Create new folder (directory) |```mkdir tmp/jormungandr```  |
| Find your mac version |```uname -a```  | 
| Check the file permissions (execute?) |```ls -l```  | 
| Check the hidden files |```ls -a```  | 
| Edit permission to execute command| ```chmod +x createAddress.sh``` | makes it executable  |
| Edit file permission to execute command | ```chmod +x faucet-send-money.sh``` | makes it executable  |
| Check if you are connecting to nodes | ```netstat -a \| grep ESTABLISHED``` [netstat reference here](https://explainshell.com/explain?cmd=netstat+-an+%7C+grep+%3A80+%7C+wc+-l) | tcp4--macbook-pro.61611lb-192-30-253-11.https ESTABLISHED |
|Check your public key from your account address|```jcli address info <insert account address here>```|
| Check the blockchain statistics | ```jcli rest v0 node stats get -h http://127.0.0.1:3100/api``` | blockRecvCnt: 0BlockDate: "217.36826"  |
|Shutdown a Node (FYI) |```jcli rest v0 shutdown get -h http://127.0.0.1:3100/api```|
| How to stop the command line if | (ctrl)+c |
|ulimit error (tbd) |```launchctl limit maxfiles``` https://forum.aeternity.com/t/solved-problems-setting-up-a-node-on-osx-mojave/1678 |
|run debug |```jormungandr --genesis-block-hash dceef4d6696ead83eadb5104c6383e1905aa81fc7a79ea2ca87a97c2bfd2f4a1 --config config.yaml --log-level=debug``` |
|find your public ip address|```dig +short myip.opendns.com @resolver1.opendns.com```|
---



How to download the UTXO list from the blockchain

```
jcli rest v0 utxo get --host "http://127.0.0.1:3100/api" 
```

 output example
- address: ca1svdr67ywnmnu2cqgzsqjsfc2px7rw4zkwagxh067ufjwp7999slt2j9yjgt
  associated_fund: 10006
  index_in_transaction: 1
  transaction_id: 7e5d7f0afea88aa54cb221f6e6b24377ce9ed95bdd1defe926a02e28a15e2bcd
- address: ca1svkrff0urjvla0c7wjxyt4963epk9lpxqrhy24pnfvju7ulngudwj3vuwe0
  associated_fund: 105427
  index_in_transaction: 0
  transaction_id: ff50694b70a3369e1235bf6919f33477d30587584ea46f0280b2b25e46f29ecf


or you can use ```curl http://127.0.0.1:3100/api/v0/node/stats``` but there are security risks.  


------


Example of Genesis.yaml file (to be verified - NIX selfnode)
---

```
genesis:
    sig_key: kes25519-12-sk1qqqqqqxrnh4zjh828faxytve8d...really-long-string
    vrf_key: vrf_sk1wtgsdfaluirbcurebpieurvjbrlerjblbrezj
    node_id: 8ca471252c536d55fiuheroiseriuaeaircapeiuhfwe
```
Format  of the genesis.yaml file\
genesis:\
  sig_key: Content of stake_pool_kes.prv file \
  vrf_key: Content of stake_pool_vrf.prv file \
  node_id: Content of stake_pool.id file 

The Official reference 
[IOHK Quickstart reference](https://input-output-hk.github.io/jormungandr/quickstart/01_command_line.html) 
---
| References    | Web links (as of Oct 2019) |
| ---      | ---       |
| Install from source    | https://github.com/input-output-hk/shelley-testnet/wiki/How-to-install-from-source       |  |
| Setup an Active Jormungandr Node   | https://github.com/input-output-hk/shelley-testnet/wiki/How-to-setup-a-Jormungandr-Networking--node-(v-0.5.0)       |
| Setup an Active Shelley Testnet Networking Node    | https://github.com/input-output-hk/shelley-testnet/wiki      |
| Setup a Passive Node |https://input-output-hk.github.io/jormungandr/quickstart/02_passive_node.html|
| Testing Transactions    | https://testnet.iohkdev.io/cardano/shelley/get-started/testing-transactions/       |
| Get $ADA testnet tokens     | https://testnet.iohkdev.io/en/cardano/shelley/tools/faucet/      |
| Create a stake pool     | https://github.com/input-output-hk/shelley-testnet/wiki/How-to-create-a-Stake-Pool        |
| Setting up stake pool distribution    | https://testnet.iohkdev.io/cardano/shelley/get-started/setting-up-stake-distribution/ 
| Rasberry Pi setup   | https://medium.com/@stakenuts/the-cardano-shelley-testnet-on-raspberry-pi-be49847fd6f9       |
| Register a stake pool     | https://input-output-hk.github.io/jormungandr/stake_pool/registering_stake_pool.html        |
| Terminal Cheatsheet for Mac (Basics)    | https://github.com/0nn0/terminal-mac-cheatsheet        |
|Rockpi setup | https://github.com/clio-one/cardano-on-the-rocks |
| API list to check | https://editor.swagger.io/?url=https://raw.githubusercontent.com/input-output-hk/jormungandr/master/doc/openapi.yaml       |
| Explain (netstat) commands | https://explainshell.com/explain?cmd=netstat+-an+%7C+grep+%3A80+%7C+wc+-l |


>Also check out the [Cardano StakePool Community on telegram](https://t.me/CardanoStakePoolWorkgroup) and the Github support triage for the Shelley testnet if you have any questions.
https://github.com/input-output-hk/shelley-testnet




| Kyleo quickstart | website |
| ------------- | ------------- |
| build/start node: | https://lovelace.community/testnet-shelley.html  |
| create account/get ada:  | https://lovelace.community/testnet-shelley-faucet.html |
| create pool: | https://lovelace.community/  |
| delegate to stake pool:| https://lovelace.community/testnet-shelley-delegate.html  |


[Official IOHK ZEN Help desk](https://iohk.zendesk.com/hc/en-us/articles/360036898153-How-to-install-Jormungandr-Networking-Linux-macOS-)