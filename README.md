# Shelley Testnet 101 on OSX
cliffc notes
>Oct 2, 2019 - This is a quick list to load and run Jormungandr 
Alpha 0.5.5 (x) from scratch (source).  I'm on a mac now. I'll try to add Win, Ubuntu, and Nix reviews.  References to other guides are below.  

_This is currently under review and construction_ 10-3-2019 \
Technical support and questions are [welcome here on Telegram.](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwj91KjF9ITlAhWMOnAKHZGiCp0QFjAAegQIARAB&url=https%3A%2F%2Ft.me%2FCardanoStakePoolWorkgroup&usg=AOvVaw2kMgG-ZJbcfxoDS77H893I) And here:
https://github.com/input-output-hk/shelley-testnet

This 101 is a supplemental guide to this \
https://github.com/input-output-hk/shelley-testnet/wiki/How-to-setup-a-Jormungandr-Networking--node-(--v0.5.0)

>Jormungandr is written in the [Rust programming language](https://github.com/rust-lang.). 

* To do list (mostly harmless)
  * load Rust (using rustup command)
  * load jormungandr program (the ring of computers around the globe)
  * load jcli (Jormungandr Command Line Interface - JCLI)
  * load sqlite (for temporary blockchain database)
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




>_Open a command line Terminal (Open
the Finder ▸ ⁨look under Applications⁩ ▸ ⁨and click Utilities⁩)_

| Steps (mostly in order) | Type these commands into the OSX computer Terminal (computer_name:~ account$) | Output example |
| ------------- | ------------- | -------------  |
|Install Rust (linked to website)|[```curl https://sh.rustup.rs -sSf sh```](https://www.rust-lang.org/tools/install)|
| Load Rust  | ```rustup install stable``` | info: checking for self-updates |
| Default  | ```rustup default stable```  | info: default toolchain set to 'stable-x86_64-apple-darwin' |
| Check the rust version | ```rustc --version``` | rustc 1.38.0 (625451e37 2019-09-23) |
|Update if old|```rustup update```|
| Check folder path if Rust fails| [```echo $PATH```](https://explainshell.com/explain?cmd=echo+%24PATH)| /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin  |
| Download Jormungandr | ``` git clone --recurse-submodules https://github.com/input-output-hk/jormungandr ```| Cloning into 'jormungandr'remote: Enumerating objects: 110, done --- Submodule path 'chain-deps': checked out   |
| Go to the Jormungandr folder | ```cd jormungandr``` | returns command prompt - macbook-pro:jormungandr cliff$  |
| Load Jormungandr | ```cargo install --path jormungandr```| Installing jormungandr v0.5.5 (/Users/cliff/jormungandr/jormungandr |
| Load jcli | ```cargo install --path jcli```| Installing jcli v0.5.2 (/Users/cliff/jormungandr/jcli)|
| Check the jcli version | ```jcli -V``` | jcli 0.5.X |
| Make a folder to store the temporary blockchain (database)|   ```mkdir -p ~/tmp/jormungandr```      |          |
| Check your ip address (public) this goes into your node-config.yaml | [```curl ifconfig.me```](https://ifconfig.me) | 14.0.17.9 |
| Configure the node |  Open (or create) node-config.yaml in editor Atom, VSCode, Github, etc.  |  See the example node-config.yaml below or [IOHK reference]((https://input-output-hk.github.io/jormungandr/quickstart/02_passive_node.html)) |
| Check your fee settings  | ```jcli rest v0 settings get -h http://127.0.0.1:3101/api``` (note 3101 port may be setup differently, you can find it in your node-config.yaml example below.) | block0Hash: adbdd5ede31637-block0Time: "2019-02-22T07:53:34+00:00 |
| Start (run) Jormungandr Node | ```jormungandr --config node-config.yaml --genesis-block-hash adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770 --log-level=info``` (note: you need to use this adbdd....hash to connect to the testnet chain.  Do not use --genesis-block block-0.bin to start the node. That is a self-node.) | Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init  |
|Shutdown a Node (FYI) |```jcli rest v0 shutdown get -h http://127.0.0.1:3101/api```||

>Troubleshooting note: If you have problems, check your path to make sure jormungandr can find the node-config.yaml. Also check your ports to make sure they are pointing to the right ones. i.e. when you run ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api ``` and change the port 3101 to 8443 you will get an error. Also the genesis block we are using for this testnet is adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770 

|  | Type these commands into the OSX computer Terminal (computer_name:~ account$) | Output example |
| ------------- | ------------- | -------------  |
| Open a new command line terminal | Terminal > shell > new window (or command + N)| new terminal opens  |
| Check the node is in 'sync' | ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api``` | blockRecvCnt:234-lastBlockDate: "217.22760"-lastBlockFees:    |
|Check the node statistics compare with jcli rest command|```curl http://127.0.0.1:3101/api/v0/node/stats```|blockRecvCnt:2923-lastBlockDate: "217.22760"-lastBlockFees:|
|Check stake pools on browser (change port 3101 to your port)|http://127.0.0.1:3101/api/v0/stake_pools||

>Now we will create a new account. [revised IOHK Documentation here](https://github.com/input-output-hk/shelley-testnet/wiki/How-to-create-a-new-Address-using-script)
 There are some [New scripts](https://github.com/input-output-hk/shelley-testnet/blob/master/scripts/createAddress.sh) if you want to skip the manual account and key making.

|Make an Account by hand|Type these commands into the OSX computer Terminal (computer_name:~ account$)| Output example |
| ------------- | ------------- | -------------  |
| Start (run) Jormungandr node | ```jormungandr --config node-config.yaml --genesis-block-hash adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770 --log-level=info``` (note: you need to use this adbdd....hash to connect to the testnet chain.  Do not use --genesis-block block-0.bin to start the node. That is a self-node.) | Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init  |
| Check the directory | ```ls``` | list of folders |
| Go to the Jormungandr folder | ```cd jormungandr``` | returns command prompt - macbook-pro:~ cliff$  |
| Make a secret key | ```jcli key generate --type=Ed25519Extended > receiver_secret.key``` | ed25519e_sk1vqsf2dh3rlg2....  |
| Make a public key from the secret key | ```cat receiver_secret.key jcli key to-public > receiver_public.key``` | ed25519_pk1nv4f5.... |
| Make an account address from the public key | ```jcli address account --testing $(cat receiver_public.key) \| tee receiver_account.txt``` | This is your receiver account (account address) ca1s56lu955y... |
| Make an account address from script|https://github.com/input-output-hk/shelley-testnet/wiki/How-to-create-a-new-Address-using-script||
| List files and folders | ```ls ``` (You should see receiver_account.txt, receiver_secret.key, receiver_public.key...) | list of all your files and folders |
| Go to the IOHK website to get ADA testnet tokens from the faucet| https://testnet.iohkdev.io/shelley/tools/faucet/ | it will give you a transaction number  |
| Check your account address to see your tokens | ```jcli rest v0 account get $(cat receiver_account.txt) -h  http://127.0.0.1:3101/api``` (note: you need to check your node-config.yaml to see what port (i.e. 3101) you are using) | counter: 0-delegation:pools:[]value: 250000000000 |
| Send tokens to account|https://input-output-hk.github.io/jormungandr/jcli/transaction.html https://github.com/input-output-hk/shelley-testnet/wiki/How-to-send-funds-using-script||

Delegate tokens to a Stake pool. 
https://github.com/input-output-hk/shelley-testnet/wiki/How-to-delegate-Account's-stake-using-script

Check the delegated tokens


Get your Stake pool key and cert
---

|   | OSX Terminal |
| ------------- | ------------- |
| Make a secret vrf key  | ```        jcli key generate --type=Curve25519_2HashDH > stake_pool_vrf.prv         ```  |
| Make a public vrf key from secret vrf key  | ```cat stake_pool_vrf.prv jcli key to-public > stake_pool_vrf.pub```  |
| Make a secret stakepool key from scratch  | ```jcli key generate --type=SumEd25519_12 > stake_pool_kes.prv``` |
| Make a public stakepool key from secret | ```cat stake_pool_kes.prv jcli key to-public > stake_pool_kes.pub``` |






|on hold|on hold||
| ------------- | ------------- | -------------  |
| Edit file permission to execute command | ```chmod +x faucet-send-certificate.sh``` | makes it executable  |
| Edit permission to execute command| ```chmod +x faucet-send-money.sh``` | makes it executable  |
| Edit permission to execute command | ```chmod +x create-account-and-delegate.sh``` | makes it executable  |
| List files to check (execute) permissions | ```ls -l``` | list of all your files and folders |
| Check if you are connecting to nodes | ```netstat -a grep ESTABLISHED``` [netstat reference here](https://explainshell.com/explain?cmd=netstat+-an+%7C+grep+%3A80+%7C+wc+-l) | tcp4--macbook-pro.61611lb-192-30-253-11.https ESTABLISHED |
| Check the blockchain statistics | ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api``` | blockRecvCnt: 0BlockDate: "217.36826"  |
| Make a secret key from scratch | ```jcli key generate --type=Ed25519```| ed25519_sk1s673ccqrrte...8037 |
| Make a public key from secret key| ```echo ed25519_sk1s673ccqrrte42cc24y43fehxypEXAPLEztce38ndejvsrel8037 jcli key to-public``` | ed25519_pk14pe9kt0kcxql... |



--- 
How to get your stake pool cert (one line command example)
---


```
jcli certificate new stake-pool-registration --kes-key kes25519-12-pk1q06kvadqp040wzc5acnnv06rjqphnavyf9xfgpf6awjnnptqef9jkk --vrf-key vrf_pk1sesgrk2k6e6rxypkcj855fnnwcs9k5zg62yhqklrzshmlj02qysdhxeqy --owner ed25519_pk14pe9kt0kcxqlj7h8g3ye2lt5mjlph0y08l2jg8u6hgwsag830qd708gl --start-validity 0 --management-threshold 1 --serial 1010101010 > stake_pool.cert
```
>This is what is would look like in logical command pieces (the computer only sees one line.)

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

---
How to update (get the new) Jormungandr version with git
---

| Git something | OSX Terminal Command |
| ------------- | ------------- |
| Load new version  | ``` git checkout v0.5.5 ```  |
| Copy from Github  | ```git pull``` |
| Check submodules  | ```git submodule update --init --recursive```  |
| Reload Jormungandr old to new | ```cargo install --path jormungandr --force```  |
| Reload jcli old to new |```cargo install --path jcli --force```  |



Other commands
---

| Other commands | OSX Terminal Command |
| ------------- | ------------- |
| Edit your folder paths for bash commands | ```touch ~/.bash_profile; open ~/.bash_profile```  |
| Find your jormungadr folder location  | ```which jormungandr``` |
| Check submodule updates  | ```git submodule update --init --recursive```  |
| Find your sudo folder | ```which sudo```  |
| Create new folder (directory) |```mkdir tmp/jormungander```  |
| Find your mac version |```uname -a```  | 
| Check the file permissions |```ls -l```  | 


---
How to stop the command line if  (ctrl)+V
---



How to download the UTXO list from the blockchain

```
jcli rest v0 utxo get --host "http://127.0.0.1:3101/api" 
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


or you can use ```curl http://127.0.0.1:3101/api/v0/node/stats ``` 


------
Example node-config.yaml file (you need to make this to connect to other machines)
---


``` 
log:
  format: "plain"
  level: "info"
  output: "stderr"
p2p:
  listen_address: "/ip4/0.0.0.0/tcp/3100"
  public_address:
  topics_of_interest:
    blocks: "high"
    messages: "high"
  trusted_peers:

    - "/ip4/3.123.177.192/tcp/3000"
    - "/ip4/3.123.155.47/tcp/3000"
    - "/ip4/52.57.157.167/tcp/3000"
    - "/ip4/3.112.185.217/tcp/3000"
    - "/ip4/18.140.134.230/tcp/3000"
    - "/ip4/18.139.40.4/tcp/3000"
    - "/ip4/3.115.57.216/tcp/3000"
    
rest:
  listen: "127.0.0.1:3101"
storage: "/tmp/jormungandr" 
 ```

-----

Example of Genesis.yaml file (this need verification)
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
| Get $ADA testnet tokens     | https://testnet.iohkdev.io/shelley/tools/faucet/       |
| Create a stake pool     | https://github.com/input-output-hk/shelley-testnet/wiki/How-to-create-a-Stake-Pool        |
| Setting up stake pool distribution    | https://testnet.iohkdev.io/cardano/shelley/get-started/setting-up-stake-distribution/    | Rasberry Pi setup   | https://medium.com/@stakenuts/the-cardano-shelley-testnet-on-raspberry-pi-be49847fd6f9       |
| Register a stake pool     | https://input-output-hk.github.io/jormungandr/stake_pool/registering_stake_pool.html        |
| Terminal Cheatsheet for Mac (Basics)    | https://github.com/0nn0/terminal-mac-cheatsheet        |
| API list to check | https://editor.swagger.io/?url=https://raw.githubusercontent.com/input-output-hk/jormungandr/master/doc/openapi.yaml       |
| Explain (netstat) commands | https://explainshell.com/explain?cmd=netstat+-an+%7C+grep+%3A80+%7C+wc+-l |
Also check out the [Cardano StakePool Community on telegram](https://t.me/CardanoStakePoolWorkgroup) and the Github support triage for the Shelley testnet if you have any questions.
https://github.com/input-output-hk/shelley-testnet




| kyleo quickstart | website |
| ------------- | ------------- |
| build/start node: | https://lovelace.community/testnet-shelley.html  |
| create account/get ada:  | https://lovelace.community/testnet-shelley-faucet.html |
| create pool: | https://lovelace.community/  |
| delegate to stake pool:| https://lovelace.community/testnet-shelley-delegate.html  |


