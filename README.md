# Shelley Testnet - cliff notes
>Oct 2, 2019 - Here are a few notes for you to load the Jormungandr Node alpha 0.5.5 (x) from source (I'm on a mac - i'll add the win and ubuntu when i get to those machines.) References to other guides are below. Nix guide would also be nice. 

Jormungandr is written in Rust programming language.
This is a quickstarter list of things to load on your mac(hine). (mostly in order: scripts are on the way.)


[IOHK Quickstart reference](https://input-output-hk.github.io/jormungandr/quickstart/01_command_line.html)


![key concepts of Cardano](https://flic.kr/p/2g6xKmp)


* to do list
  * load rust
  * load jormungandr
  * load jcli
  * load sqlite
  * edit config
  * edit 
  * edit




_This is under construction_

_Load Rust from the Terminal - Open
(Finder ▸ ⁨Applications⁩ ▸ ⁨Utilities⁩)_

| Steps | OSX Terminal command | Output example |
| ------------- | ------------- | -------------  |
| Load Rust  | ```rustup install stable``` | info: checking for self-updates |
| default  | ```rustup default stable```  | info: default toolchain set to 'stable-x86_64-apple-darwin' |
| check the version | ```rustc --version``` | rustc 1.38.0 (625451e37 2019-09-23) |
| download jormungandr | ```git clone --recurse-submodules https://github.com/input-output-hk/jormungandr```| Cloning into 'jormungandr'remote: Enumerating objects: 110, done --- Submodule path 'chain-deps': checked out   |
| go to the folder | ```cd jormungandr``` | returns command prompt - macbook-pro:~ cliff$  |
| check the directory | ```ls``` | list of folders |
| load jormungandr | ```cargo install --path jormungandr```| Installing jormungandr v0.5.2 (/Users/cliff/jormungandr/jormungandr |
| load jcli | ```cargo install --path jcli```| Installing jcli v0.5.2 (/Users/cliff/jormungandr/jcli)|
| check folder paths| ```echo $PATH```| /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin  |
| check your ip address | ```curl ifconfig.me``` | 14.0.17.9 |
| check your fee settings (note 3101 port may be setup differently) | ```jcli rest v0 settings get -h http://127.0.0.1:3101/api``` | block0Hash: adbdd5ede31637-block0Time: "2019-02-22T07:53:34+00:00 |
| start (run) jormungandr node| ```jormungandr --config node-config.yaml --genesis-block-hash adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770 --log-level=info``` | Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init  |
| Open a new command line window | mouse over - shell > new window (or command + N)| new terminal opens  |
| check the node for current blockchain height | ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api``` | blockRecvCnt: 0-lastBlockDate: "217.22760"-lastBlockFees:    |
| make a secret key | ```jcli key generate --type=Ed25519Extended > receiver_secret.key``` | -------------  |
| make a public key from secret key | ```cat receiver_secret.key \| jcli key to-public > receiver_public.key``` | -------------  |
| make an account address | ```jcli address account --testing $(cat receiver_public.key) \| tee receiver_account.txt``` | his is your receiver account (account address) ca1s56lu955y... |
| edit file permission to execute command | ```chmod +x faucet-send-certificate.sh``` | -------------  |
| edit permission to execute command| ```chmod +x faucet-send-money.sh``` | -------------  |
| edit permission to execute command | ```chmod +x create-account-and-delegate.sh``` | -------------  |
| list folder | ```ls -l``` | -------------  |
| check if you are connecting to nodes | ```netstat -a \|grep ESTABLISHED``` | tcp4--macbook-pro.61611lb-192-30-253-11.https ESTABLISHED |
| go to the IOHK website to get ADA testnet coins from the faucet| https://testnet.iohkdev.io/shelley/tools/faucet/ | it will give you a transaction number  |
| check your account address to see your coins | ```jcli rest v0 account get $(cat receiver_account.txt) -h  http://127.0.0.1:3101/api``` | counter: 0-delegation:pools:[]value: 250000000000 |
| check the blockchain statistics | ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api``` | blockRecvCnt: 0BlockDate: "217.36826"  |
| make a secret key from scratch | ```jcli key generate --type=Ed25519```| ed25519_sk1s673ccqrrte... |
| make a public key from secret key| ```echo ed25519_sk1s673ccqrrte42cc24y43fehxypqjk9ad55hsvpygztce38neejvsel8037 \| jcli key to-public``` | ed25519_pk14pe9kt0kcxql... |
| ------------- | ------------- | -------------  |
| ------------- | ------------- | -------------  |
| left | intentionally  | blank  |
| ------------- | ------------- | -------------  |
| ------------- | ------------- | -------------  |
| Get your Stake pool key and cert | ------------- | -------------  |
| ------------- | ------------- | -------------  |
| ------------- | ------------- | -------------  |
| check the jcli version | ```jcli -V``` | jcli 0.5.X  |
| ------------- | ------------- | -------------  |
| ------------- | ------------- | -------------  |
| ------------- | ------------- | -------------  |
| ------------- | ------------- | -------------  |


| Get your Stake pool key and cert  | OSX Terminal |
| ------------- | ------------- |
| make a secret voting key  | ```jcli key generate --type=Curve25519_2HashDH > stake_pool_vrf.prv```  |
| make a public voting key from secret voting key  | ```cat stake_pool_vrf.prv \| jcli key to-public > stake_pool_vrf.pub```  |
| make a secret stakepool key  from scratch  | ```jcli key generate --type=SumEd25519_12 > stake_pool_kes.prv``` |
| make a public stakepool key from secret | ```cat stake_pool_kes.prv \| jcli key to-public > stake_pool_kes.pub``` |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |





--- 
How to get your stake pool cert (example)
---


```jcli certificate new stake-pool-registration --kes-key kes25519-12-pk1q06kvadqp040wzc5acnnv06rjqns8aphnavyf9xfgpf6awjnnptqef9jkk --vrf-key vrf_pk1sesgrk2k6e6rxypkcj855fnnw8cs9k5zg62yhqklrzshmlj02qysdhxeqy --owner ed25519_pk14pe9kt0kcxqlj7h8g3ye2ljt5mjlph0y08l2jg8u6hgwsgag830qd708gl --start-validity 0 --management-threshold 1 --serial 1010101010 > stake_pool.cert```



---
How to update (get the new) jormungandr version with git
---

| git something | OSX Terminal Command |
| ------------- | ------------- |
| Load new version  | ```git checkout v0.5.5```  |
| Copy from Github  | ```git pull``` |
| check submodules  | ```git submodule update --init --recursive```  |
| Reload jormungandr old to new | ```cargo install --path jormungandr --force```  |
| Reload jcli old to new |```cargo install --path jcli --force```  |
| Content Cell  | Content Cell  
| Content Cell	| Content Cell


Other commands
---

| other bash commands | OSX Terminal Command |
| ------------- | ------------- |
| edit your folder paths for bash commands | ```touch ~/.bash_profile; open ~/.bash_profile```  |
| find your jormungadr folder location  | ```which jormungandr``` |
| check submodule updates  | ```git submodule update --init --recursive```  |
| find your sudo folder | ```which sudo```  |
| find your mac version |```uname -a```  |
| Content Cell  | Content Cell  
| Content Cell	| Content Cell


---
How to stop the command line if  (ctrl)+V
---



how to download the utxo from the blockchain

 `jcli rest v0 utxo get --host "http://127.0.0.1:3101/api"`

 output example
- address: ca1svdr67ywnmnu2cqgzsqjsfc2px7rw4zkwagxh067ufjwp7999slt2j9yjgt
  associated_fund: 10006
  index_in_transaction: 1
  transaction_id: 7e5d7f0afea88aa54cb221f6e6b24377ce9ed95bdd1defe926a02e28a15e2bcd
- address: ca1svkrff0urjvla0c7wjxyt4963epk9lpxqrhy24pnfvju7ulngudwj3vuwe0
  associated_fund: 105427
  index_in_transaction: 0
  transaction_id: ff50694b70a3369e1235bf6919f33477d30587584ea46f0280b2b25e46f29ecf

| References    | Weblink (as of Oct 2019) |
| ---      | ---       |
| API list | https://editor.swagger.io/?url=https://raw.githubusercontent.com/input-output-hk/jormungandr/master/doc/openapi.yaml       |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |
| lkndf;lkns;dflkng     | sldf;erjfr        |




| kyleo quickstart | website |
| ------------- | ------------- |
| build/start node: | https://lovelace.community/testnet-shelley.html  |
| create account/get ada:  | https://lovelace.community/testnet-shelley-faucet.html |
| create pool: | https://lovelace.community/  |
| delegate to stake pool:| https://lovelace.community/testnet-shelley-delegate.html  |


