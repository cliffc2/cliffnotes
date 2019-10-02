# cliffnotes 


Doctors-MBP:~ cliff$ 'rustc --version'
rustc 1.38.0 (625451e37 2019-09-23)
Doctors-MBP:~ cliff$ ls
Applications		Movies			VirtualBox VMs
Desktop			Music			msfinstall
Documents		Pictures		package-lock.json
Downloads		Public			quickstart
Library			PycharmProjects


Doctors-MBP:~ cliff$ rustup install stable
info: syncing channel updates for 'stable-x86_64-apple-darwin'

  stable-x86_64-apple-darwin unchanged - rustc 1.38.0 (625451e37 2019-09-23)

info: checking for self-updates
Doctors-MBP:~ cliff$ rustup default stable
info: using existing install for 'stable-x86_64-apple-darwin'
info: default toolchain set to 'stable-x86_64-apple-darwin'

  stable-x86_64-apple-darwin unchanged - rustc 1.38.0 (625451e37 2019-09-23)



Doctors-MBP:~ cliff$ git clone --recurse-submodules https://github.com/input-output-hk/jormungandr
Cloning into 'jormungandr'...
remote: Enumerating objects: 110, done.
remote: Counting objects: 100% (110/110), done.
remote: Compressing objects: 100% (74/74), done.
remote: Total 33209 (delta 49), reused 74 (delta 34), pack-reused 33099
Receiving objects: 100% (33209/33209), 12.32 MiB | 1.09 MiB/s, done.
Resolving deltas: 100% (21232/21232), done.
Submodule 'chain-deps' (https://github.com/input-output-hk/chain-libs) registered for path 'chain-deps'
Cloning into '/Users/cliff/jormungandr/chain-deps'...
remote: Enumerating objects: 223, done.        
remote: Counting objects: 100% (223/223), done.        
remote: Compressing objects: 100% (138/138), done.        
remote: Total 9294 (delta 107), reused 147 (delta 84), pack-reused 9071        
Receiving objects: 100% (9294/9294), 1.69 MiB | 304.00 KiB/s, done.
Resolving deltas: 100% (6033/6033), done.
Submodule path 'chain-deps': checked out '6e842963ac1546173005736712f3cfcb5f7243e4'


Doctors-MBP:~ cliff$ cd jormungandr


Doctors-MBP:jormungandr cliff$ ls
CHANGELOG.md			doc
Cargo.lock			docker
Cargo.toml			jcli
LICENSE-APACHE		jormungandr
LICENSE-MIT			jormungandr-integration-tests
README.md			jormungandr-lib
ROADMAP.md			jormungandr-scenario-tests
appveyor.yml			scripts
book.toml			shell.nix
chain-deps			target
ci					tools


Doctors-MBP:jormungandr cliff$ cargo install --path jormungandr

  Installing jormungandr v0.5.2 (/Users/cliff/jormungandr/jormungandr)
    Updating crates.io index
    Updating git repository `https://github.com/tower-rs/tower-http`
  Downloaded actix-net v0.2.6
  Downloaded actix-threadpool v0.1.2
  Downloaded bincode v1.2.0
  Downloaded bytes v0.4.12

Doctors-MBP:jormungandr cliff$ cargo install --path jcli
  Installing jcli v0.5.2 (/Users/cliff/jormungandr/jcli)
    Updating crates.io index
  Downloaded gtmpl v0.5.6
  Downloaded reqwest v0.9.20
  Downloaded strfmt v0.1.6
  Downloaded openapiv3 v0.3.0
  Downloaded cookie v0.12.0……………

    Finished release [optimized] target(s) in 2m 17s
  Installing /Users/cliff/.cargo/bin/jcli
   Installed package `jcli v0.5.2 (/Users/cliff/jormungandr/jcli)` (executable `jcli`)


Doctors-MBP:~ cliff$ echo $PATH
/Users/cliff/jormungandr-nix:/Users/cliff/.cargo/bin/jormungandr:/Users/cliff/.nix-profile/bin:/Users/cliff/.cargo/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin



Doctors-MBP:jormungandr cliff$ curl ifconfig.me
14.0.170.99Doctors-MBP:jormungandr cliff$

Doctors-MBP:jormungandr cliff$ jcli rest v0 settings get -h http://127.0.0.1:3101/api
---
block0Hash: adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770
block0Time: "2019-02-22T07:53:34+00:00"
consensusVersion: genesis
currSlotStartTime: ~
fees:
  certificate: 10000
  coefficient: 50
  constant: 1000
maxTxsPerBlock: 255
Doctors-MBP:jormungandr cliff$



Doctors-MBP:jormungandr cliff$ jormungandr --config node-config.yaml --genesis-block-hash adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770 --log-level=info
Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init
Sep 28 04:32:15.875 WARN Node started without path to the stored secret keys (not a stake pool or a BFT leader), task: init
Sep 28 04:32:15.876 INFO storing blockchain in '"/tmp/jormungandr/blocks.sqlite"', task: init
Sep 28 04:32:15.901 INFO fetching block adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770, peer_address: 18.139.40.4:3000, block: adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770, task: init


Open a new command line

Doctors-MBP:jormungandr cliff$ jcli rest v0 node stats get -h http://127.0.0.1:3101/api
---
blockRecvCnt: 0
lastBlockDate: "217.22760"
lastBlockFees: 0
lastBlockHash: 52850e0bdde9e9e220cdf062fb88a0b3027ea6eabd5ac3b9984b3c3effa352b3
lastBlockHeight: "9764"
lastBlockSum: 0
lastBlockTime: ~
lastBlockTx: 0
txRecvCnt: 0
uptime: 840




Doctors-MBP:jormungandr cliff$ jcli key generate --type=Ed25519Extended > receiver_secret.key
Doctors-MBP:jormungandr cliff$ cat receiver_secret.key | jcli key to-public > receiver_public.key
Doctors-MBP:jormungandr cliff$ jcli address account --testing $(cat receiver_public.key) | tee receiver_account.txt


ca1s56lu955ypzmpq3q6stf0lkdszcl0nxfvumzsd9tr4t4lw6yw89j7cu0ytl





Doctors-MBP:jormungandr cliff$ chmod +x faucet-send-certificate.sh
Doctors-MBP:jormungandr cliff$ chmod +x faucet-send-money.sh
Doctors-MBP:jormungandr cliff$ chmod +x create-account-and-delegate.sh
Doctors-MBP:jormungandr cliff$ ls -l





Doctors-MBP:jormungandr cliff$ jcli key generate --type=Ed25519Extended > receiver_secret.key
Doctors-MBP:jormungandr cliff$ cat receiver_secret.key | jcli key to-public > receiver_public.key
Doctors-MBP:jormungandr cliff$ jcli address account --testing $(cat receiver_public.key) | tee receiver_account.txt
ca1s56lu955ypzmpq3q6stf0lkdszcl0nxfvumzsd9tr4t4lw6yw89j7cu0ytl





Doctors-MBP:~ cliff$ netstat -a |grep ESTABLISHED
tcp4       0      0  doctors-mbp.61611      lb-192-30-253-11.https ESTABLISHED
tcp4       0      0  doctors-mbp.61610      lb-192-30-253-11.https ESTABLISHED
tcp4       0      0  doctors-mbp.61609      149.154.171.236.https  ESTABLISHED
tcp4       0      0  doctors-mbp.61608      149.154.171.237.https  ESTABLISHED
tcp4       0      0  doctors-mbp.61607      hkg12s02-in-f10..https ESTABLISHED
tcp4       0      0  doctors-mbp.61606      hkg12s02-in-f3.1.https ESTABLISHED
tcp4       0      0  doctors-mbp.61605      104.19.197.151.https   ESTABLISHED
tcp4       0      0  doctors-mbp.61604      hkg07s21-in-f10..https ESTABLISHED
tcp4       0      0  doctors-mbp.61603      ip-203-210-7-9.c.http  ESTABLISHED
tcp4       0      0  doctors-mbp.61599      ec2-18-185-78-15.https ESTABLISHED
tcp4       0      0  doctors-mbp.61597      hkg07s23-in-f4.1.https ESTABLISHED
tcp4       0      0  doctors-mbp.61595      hkg07s23-in-f4.1.https ESTABLISHED
tcp4       0      0  doctors-mbp.61593      server-52-84-42-.https ESTABLISHED
tcp4       0      0  doctors-mbp.61591      104.20.74.28.https     ESTABLISHED
tcp4       0      0  doctors-mbp.61590      hkg12s18-in-f5.1.https ESTABLISHED
tcp4       0      0  doctors-mbp.61585      ec2-35-169-108-1.https ESTABLISHED
tcp4       0      0  doctors-mbp.61564      lb-140-82-114-26.https ESTABLISHED
tcp4       0      0  doctors-mbp.61558      hkg12s17-in-f3.1.https ESTABLISHED
tcp4       0      0  doctors-mbp.61555      lb-192-30-253-12.https ESTABLISHED
tcp4       0      0  doctors-mbp.61550      108.177.125.189.https  ESTABLISHED
tcp4       0      0  doctors-mbp.61545      149.154.171.237.https  ESTABLISHED
tcp4       0     28  doctors-mbp.61537      lb-140-82-113-25.https ESTABLISHED
tcp4       0      0  doctors-mbp.61069      104.27.144.211.https   ESTABLISHED
tcp4       0      0  doctors-mbp.61009      ec2-18-140-134-2.hbci  ESTABLISHED
tcp4       0      0  doctors-mbp.61008      ec2-3-123-155-47.hbci  ESTABLISHED
tcp4       0      0  doctors-mbp.61007      ec2-3-123-177-19.hbci  ESTABLISHED
tcp4       0      0  doctors-mbp.61006      ec2-18-139-40-4..hbci  ESTABLISHED
tcp4       0      0  doctors-mbp.61005      ec2-52-57-157-16.hbci  ESTABLISHED
tcp4       0      0  doctors-mbp.61004      ec2-3-115-57-216.hbci  ESTABLISHED
tcp4       0      0  doctors-mbp.61003      ec2-3-112-185-21.hbci  ESTABLISHED
tcp4       0      0  doctors-mbp.59227      ec2-34-230-213-1.https ESTABLISHED
tcp4       0      0  doctors-mbp.59226      ec2-34-238-90-25.https ESTABLISHED
tcp4       0      0  doctors-mbp.59225      151.101.78.49.https    ESTABLISHED
tcp4       0      0  doctors-mbp.59223      ec2-52-0-144-134.https ESTABLISHED
tcp4       0      0  doctors-mbp.59215      ec2-52-34-90-166.https ESTABLISHED
tcp4       0      0  doctors-mbp.59212      17.57.145.84.5223      ESTABLISHED
tcp4       0      0  localhost.13823        localhost.49216        ESTABLISHED
tcp4       0      0  localhost.49216        localhost.13823        ESTABLISHED


GO TO THE FAUCET PUT IN YOUR ACCOUNT ADDRESS
ca1s56lu955ypzmpq3q6stf0lkdszcl0nxfvumzsd9tr4t4lw6yw89j7cu0ytl



Check the account
Doctors-MBP:~ cliff$ jcli rest v0 account get $(cat receiver_account.txt) -h  http://127.0.0.1:3101/api
---
counter: 0
delegation:
  pools: []
value: 250000000000
Doctors-MBP:~ cliff$ 







Get the node statistics
Doctors-MBP:~ cliff$ jcli rest v0 node stats get -h http://127.0.0.1:3101/api
---
blockRecvCnt: 0
lastBlockDate: "217.36826"
lastBlockFees: 0
lastBlockHash: b4d502072b97e32ab4f5a2b9d15e8fc487fb7b285c66493b339bb77ff5de803d
lastBlockHeight: "12536"
lastBlockSum: 0
lastBlockTime: ~
lastBlockTx: 0
txRecvCnt: 0
uptime: 346







make a private key (demo)
jcli key generate --type=Ed25519
ed25519_sk1s673ccqrrte42cc24y43fehxypqjk9ad55hsvpygztce38neejvsel8037


Make a public key
echo ed25519_sk1s673ccqrrte42cc24y43fehxypqjk9ad55hsvpygztce38neejvsel8037 | jcli key to-public
ed25519_pk14pe9kt0kcxqlj7h8g3ye2ljt5mjlph0y08l2jg8u6hgwsgag830qd708gm






Doctors-MBP:~ cliff$ jcli key generate --type=Curve25519_2HashDH > stake_pool_vrf.prv
Doctors-MBP:~ cliff$ cat stake_pool_vrf.prv | jcli key to-public > stake_pool_vrf.pub



Doctors-MBP:~ cliff$ jcli key generate --type=SumEd25519_12 > stake_pool_kes.prv
Doctors-MBP:~ cliff$ cat stake_pool_kes.prv | jcli key to-public > stake_pool_kes.pub




Doctors-MBP:~ cliff$ jcli -V
jcli 0.5.X



Doctors-MBP:~ cliff$ jcli certificate new stake-pool-registration --kes-key kes25519-12-pk1q06kvadqp040wzc5acnnv06rjqns8aphnavyf9xfgpf6awjnnptqef9jkk --vrf-key vrf_pk1sesgrk2k6e6rxypkcj855fnnw8cs9k5zg62yhqklrzshmlj02qysdhxeqy --owner ed25519_pk14pe9kt0kcxqlj7h8g3ye2ljt5mjlph0y08l2jg8u6hgwsgag830qd708gl --start-validity 0 --management-threshold 1 --serial 1010101010 > stake_pool.cert



How to get the new jormungandr version with git
Doctors-MBP:~ cliff$ git checkout v0.5.5
Doctors-MBP:~ cliff$ git pull
Doctors-MBP:~ cliff$ git submodule update --init --recursive
Doctors-MBP:~ cliff$ cargo install --path jormungandr --force
Doctors-MBP:~ cliff$ cargo install --path jcli --force


Doctors-MBP:~ cliff$ touch ~/.bash_profile; open ~/.bash_profile
Doctors-MBP:~ cliff$ which jormungandr
/Users/cliff/.cargo/bin/jormungandr
Doctors-MBP:~ cliff$ which sudo
/usr/bin/sudo
Doctors-MBP:~ cliff$ uname -a
Darwin Doctors-MBP 18.2.0 Darwin Kernel Version 18.2.0: Fri Oct  5 19:41:49 PDT 2018; root:xnu-4903.221.2~2/RELEASE_X86_64 x86_64


How to stop the command line if  (ctrl)+V




Doctors-MBP:~ cliff$ jcli rest v0 utxo get --host "http://127.0.0.1:3101/api"
---
- address: ca1svdr67ywnmnu2cqgzsqjsfc2px7rw4zkwagxh067ufjwp7999slt2j9yjgt
  associated_fund: 10006
  index_in_transaction: 1
  transaction_id: 7e5d7f0afea88aa54cb221f6e6b24377ce9ed95bdd1defe926a02e28a15e2bcd
- address: ca1svkrff0urjvla0c7wjxyt4963epk9lpxqrhy24pnfvju7ulngudwj3vuwe0
  associated_fund: 105427
  index_in_transaction: 0
  transaction_id: ff50694b70a3369e1235bf6919f33477d30587584ea46f0280b2b25e46f29ecf
- address: ca1s0vje52fqww0l84g6pvvwt3cty3a7ldxqmm7p693d7rqtwhs5ds6ynyrznh
  associated_fund: 10974
  index_in_transaction: 1
  transaction_id: ff50694b70a3369e1235bf6919f33477d30587584ea46f0280b2b25e46f29ecf
- address: ca1s0mu00uudsyaha3xgtveam9theyxcjmcqz2kd0zqjwg0h4chvnqcwxwepkv
  associated_fund: 45
  index_in_transaction: 1
  transaction_id: c666e6660e42c62ce5128b51af251dfa93014a8f6a4faf2beb247f08414a0c72
- address: ca1sw234hvnclezc3dg6xx7kavgzjt676tfjc747kc82g9cu3avkrursjtff0d
  associated_fund: 45888
  index_in_transaction: 1
  transaction_id: be3dfe62dce4ee387a8570c0c0b510e002b049b9e2fc9f2cec688d993aa90ba6
- address: ca1sdhg04mapjeamg858sucqqe7k8767a4pddjwzep4awerytjvryhwy705z0m
  associated_fund: 125701
  index_in_transaction: 0
  transaction_id: c33982ac5fb8d87d237d028f8985be1dec9c8e81d734b98e60a8996383a99619
