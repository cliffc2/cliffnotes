# Shelley Testnet command list on OSX
cliffc notes test
>Oct 2, 2019 - This is a quick check list to load and run Jormungandr 
Alpha 0.x.x from scratch (source). Binaries are here. https://github.com/input-output-hk/jormungandr/releases/ I'm on a old mac. This is to teach and learn about the stake pools of a decentralized POS blockchain. Feel free to experiment. References to other guides are below. [Official IOHK ZEN Help desk](https://iohk.zendesk.com/hc/en-us/articles/360036898153-How-to-install-Jormungandr-Networking-Linux-macOS-)

_This is currently under review and construction_ 10-3-2019 \
MOST CURRENT BINARIES 0.7.0rc2
https://github.com/input-output-hk/jormungandr/releases/
Technical support and questions are [welcome here on Telegram.](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwj91KjF9ITlAhWMOnAKHZGiCp0QFjAAegQIARAB&url=https%3A%2F%2Ft.me%2FCardanoStakePoolWorkgroup&usg=AOvVaw2kMgG-ZJbcfxoDS77H893I) And here:
https://iohk.zendesk.com/hc/en-us

This is a supplemental guide to this \
https://iohk.zendesk.com/hc/en-us/categories/360002383814-Shelley-Networked-Testnet

>Jormungandr is written in the [Rust programming language](https://github.com/rust-lang.). 

* To do list (mostly harmless)
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




>_Open a command line Terminal (Open
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
| Check the jcli version | ```jcli -V``` | jcli 0.5.X |
| Make a folder to store the temporary blockchain (database)|   ```mkdir -p ~/tmp/jormungandr```      |   this path needs to be in your node-config.yaml (see below)     |
| Check your ip address (public) this goes into your node-config.yaml | [What is my IP address](https://www.whatismyip.com/) | 143.0.173.9 |
| Configure the node |  Open (or create) node-config.yaml   |  See the example node-config.yaml below or [IOHK reference]((https://input-output-hk.github.io/jormungandr/quickstart/02_passive_node.html)) |

>Example node-config.yaml file (you need to make this to connect to other machines. change the public address check your ip address; use [ifconfig.me](ifconfig.me) and check the ports i.e. 3101, storage folder needs to match also.)
---


``` 
log:
  format: plain
  level: info
  output: stderr
p2p:
  listen_address: "/ip4/0.0.0.0/tcp/3100"
  trusted_peers:
   - address: "/ip4/13.230.137.72/tcp/3000"
     id: ed25519_pk1w6f2sclsauhfd6r9ydgvn0yvpvg4p3x3u2m2n7thknwghrfpdu5sgvrql9           
   - address: "/ip4/13.230.48.191/tcp/3000"
     id: ed25519_pk1lzrdh0pcmhwcnqdl5cgcu7n0c76pm7g7p6pdey7wup54vz32gy6qlz5vnq        
   - address: "/ip4/18.196.168.220/tcp/3000"
     id: ed25519_pk1uufkgu0t9xm8ry04wnddtnku5gjg8typf5z6ehh65uc6nz4j8n4spq0xrl
   - address: "/ip4/3.124.132.123/tcp/3000"
     id: ed25519_pk14tqkqnz3eydn0c8c8gmmyzxgnf2dztpy5dnrx09mhfzv0dh93s3qszqgpc
   - address: "/ip4/18.184.181.30/tcp/3000"
     id: ed25519_pk178ge2jn6c40vgmrewgmg26nmtda47nk2jncukzj327mp3a9g2qzss2d44f
   - address: "/ip4/184.169.162.15/tcp/3000"
     id: ed25519_pk1nk0ne8ez66w5tp2g8ctcakthjpz89eveyg0egcpylenhet83n0sq2jqz8q
   - address: "/ip4/13.56.87.134/tcp/3000"
     id: ed25519_pk1ce450zrtn04eaevcn9csz0thpjuhxrysdrq6qlr9pq7e0wd842nsxy6r5k
     
rest:
  listen: "127.0.0.1:3101"
storage: "/tmp/jormungandr"  

 ```

-----
>Troubleshooting note: If you have problems, check your path to make sure jormungandr can find the node-config.yaml (should be in the jormangandr folder). Also check your ports to make sure they are pointing to the right number. i.e. when you run ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api ``` but the port is 3000 or some other number you will get an error. Also the genesis block (BLOCK0_HASH) we are using for this 0.5.6 testnet is adbdd5ede31637f6c9bad5c271eec0bc3d0cb9efb86a5b913bb55cba549d0770 
for 0.7.0 rc1 ```jormungandr --config node-config.yaml --genesis-block-hash ae57995b8fe086ba590c36dc930f2aa9b52b2ffa92c0698fff2347adafe8dc65 --log-level=info```


| Next steps (mostly in order) | Type these commands into the OSX computer Terminal (computer_name:~ account$) | Output example |
| ------------- | ------------- | -------------  |
| Start (run) Jormungandr Node | ```jormungandr --config node-config.yaml --genesis-block-hash ae57995b8fe086ba590c36dc930f2aa9b52b2ffa92c0698fff2347adafe8dc65 --log-level=info``` (note: you need to use this adbdd....hash to connect to the testnet chain.  Do not use --genesis-block block-0.bin to start the node. That is a self-node.) | Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init  |
| Open a new command line terminal | Terminal > shell > new window (or command + N)| new terminal opens  |
| Check the node is in 'sync' | ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api``` | blockRecvCnt:234-lastBlockDate: "217.22760"-lastBlockFees:    |
| Check your fee settings  | ```jcli rest v0 settings get -h http://127.0.0.1:3101/api``` (note 3101 port may be setup differently, you can find it in your node-config.yaml example below.) | block0Hash: adbdd5ede31637-block0Time: "2019-02-22T07:53:34+00:00 |
| Check the node statistics compare with jcli rest command|```curl http://127.0.0.1:3101/api/v0/node/stats```|blockRecvCnt:2923-lastBlockDate: "217.22760"-lastBlockFees:|
| You can also check from your browser. (check your port)|http://127.0.0.1:3101/api/v0/stake_pools||

>Now we will create a new account. [revised IOHK Documentation here](https://iohk.zendesk.com/hc/en-us/categories/360002383814-Shelley-Networked-Testnet)
 There are some [New scripts](https://github.com/input-output-hk/shelley-testnet/tree/master/scripts) if you want to skip the manual account and key making.

|Make an Account by hand|Type these commands into the OSX computer Terminal (computer_name:~ account$)| Output example |
| ------------- | ------------- | -------------  |
| Start (run) Jormungandr Passive Node | ```jormungandr --config node-config.yaml --genesis-block-hash ae57995b8fe086ba590c36dc930f2aa9b52b2ffa92c0698fff2347adafe8dc65 --log-level=info``` (note: you need to use this adbdd....hash to connect to the testnet chain.  Do not use --genesis-block block-0.bin to start the node. That is a self-node.) | Sep 28 04:32:15.874 INFO Starting jormungandr 0.5.2 (master-0b40827e, release, macos [x86_64]) - [rustc 1.38.0 (625451e37 2019-09-23)], task: init  |
| Check the directory | ```ls``` | list of folders |
| Go to the Jormungandr folder | ```cd jormungandr``` | returns command prompt - macbook-pro:~ cliff$  |
|Now we can make keys| note - new key making script here so you can skip to the faucet step. https://github.com/input-output-hk/shelley-testnet/wiki/How-to-create-a-new-Address-using-script|```createAddress.sh account```|
|skip|Check permissions|```ls -l```|
|skip|Change permissions|```chmod +x createAddress.sh```|
|skip|run script ```createAddress.sh account```|```createAddress.sh account```|
| Make a secret key | ```jcli key generate --type=Ed25519Extended > receiver_secret.key``` | ed25519e_sk1vqsf2dh3rlg2....  |
| Make a public key from the secret key | ```cat receiver_secret.key jcli key to-public > receiver_public.key``` | ed25519_pk1nv4f5.... |
| Make an account address from the public key | ```jcli address account --testing $(cat receiver_public.key) \| tee receiver_account.txt``` | This is your receiver account (account address) ca1s56lu955y... |
| List files and folders in jormungandr | ```ls ``` (You should see receiver_account.txt, receiver_secret.key, receiver_public.key...) | list of all your files and folders |
| Go to the IOHK website to get ADA testnet tokens from the faucet| Now we can go get testnet tokens https://testnet.iohkdev.io/shelley/tools/faucet/ | it will give you a transaction number  |
| Check your account address to see your tokens | ```jcli rest v0 account get $(cat receiver_account.txt) -h  http://127.0.0.1:3101/api``` (note: you need to check your node-config.yaml to see what port (i.e. 3101) you are using) | counter: 0 -delegation:pools:[] value: 250000000000 |
| Send tokens to account | Now we can send tokens (money) using a script.  https://github.com/input-output-hk/shelley-testnet/blob/master/scripts/send-money.sh ```send-money.sh <ADDRESS> <AMOUNT> <REST-LISTEN-PORT> <SOURCE-SK>``` | |
| Check the message log to see tx |```jcli rest v0 message logs --host "http://127.0.0.1:3101/api```|

>OUTPUT
================Send Money=================
DESTINATION_ADDRESS: ca1sdj6vsyq4qdfrm0t5h4cgftld238lvxc7dp3h5ph5ld89ydlylh659d0q5g
DESTINATION_AMOUNT: 10000
REST_PORT: 3101...

|   | Delegate script |
| ------------- | ------------- |
| Delegate tokens to a Stake pool. | Now we can delegate using a script. https://github.com/input-output-hk/shelley-testnet/blob/master/scripts/delegate-account.sh ``` delegate-account.sh <STAKE_POOL_ID> <REST-LISTEN-PORT> <ACCOUNT-SK> ```Here is the IOHK reference https://github.com/input-output-hk/shelley-testnet/wiki/How-to-delegate-Account  |



Check the delegated tokens - tbc


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
| Check the blockchain statistics | ```jcli rest v0 node stats get -h http://127.0.0.1:3101/api``` | blockRecvCnt: 0BlockDate: "217.36826"  |
|Shutdown a Node (FYI) |```jcli rest v0 shutdown get -h http://127.0.0.1:3101/api```|
| How to stop the command line if | (ctrl)+c |
|ulimit error (tbd) |```launchctl limit maxfiles``` https://forum.aeternity.com/t/solved-problems-setting-up-a-node-on-osx-mojave/1678 |
|run debug |```jormungandr --config node-config.yaml --genesis-block-hash ae57995b8fe086ba590c36dc930f2aa9b52b2ffa92c0698fff2347adafe8dc65 --log-level=debug``` |
|find your public ip address|```dig +short myip.opendns.com @resolver1.opendns.com```|
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


or you can use ```curl http://127.0.0.1:3101/api/v0/node/stats``` but there are security risks.  


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
| Get $ADA testnet tokens     | https://testnet.iohkdev.io/shelley/tools/faucet/       |
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


