# Apollo

### :rocket: Strap some rockets to go-rupaya

## Table of contents


  * [Installation](#installation)
  * [Configuration](#configuration)
  * [Usage](#usage)
    + [Setting up a masternode with no initial masternode address](#setting-up-a-masternode-with-no-initial-masternode-address)
    + [Setting up a masternode with an existing masternode address (importing)](#setting-up-a-masternode-with-an-existing-masternode-address--importing-)
    + [Connecting to our network with MetaMask](#connecting-to-our-network-with-metamask)
    + [Run latest dev branch](#run-latest-dev-branch)
  * [Common issues](#common-issues)
  * [Upgrading go-rupaya](#upgrading-go-rupaya)
  * [Upgrade Apollo](#upgrade-apollo)
  * [Known bugs](#known-bugs)

## Installation

On a vanilla linux vps please run this command 
`bash install-server.sh`

Depending on your security level in your shell, the root password can be asked during the installation script to execute `sudo` commands during installation.

`git clone https://github.com/rupayaproject/Apollo`

If you don't have Golang and/or go-rupaya installed yet, run our installation script:
`cd Apollo`
`bash install-server.sh`.
Follow the prompts and accept/enter when asked. Once finished you might be asked to close/restart the terminal.
On a successfull install you should have `go-rupaya` as a directory alongside `Apollo`.

Optional: create a directory to store the masternode/chain data:
`mkdir YOUR_DATADIR`

## Configuration

From within the Apollo directory, run `bash apollo.sh start`.

The start command will execute the configuration helper. Please follow the steps displayed on the console to setup Apollo once.

## Usage

Run the apollo scipt by executing `bash apollo.sh` along with one of the following parameters:

 - `start` Launches the masternode
 - `stop` Stops the rupaya masternodes
 - `import` Allows a user to import a private key
 - `force-close` Force close all running rupaya instances
 - `update` Update the Apollo files to their latest version
 - `log` Shows the daemon output. Ctrl+c to exit.
 - `clean` Remove the entire datadir

 **Hint!** You can run all these actions in one go by running `bash apollo.sh start`. This executes all needed steps in a single command.

 Enter any key in your console to let the masternode run in the background.

 Check if you are displayed on our stats page http://stats.rupaya.io

 Send our developers a DM to receive some testnet tokens in order to activate and setup your masternode.


---

### Setting up a masternode with no initial masternode address

`bash apollo.sh start` for the first time.

It will ask you if you want to create a new coinbase account, or import an existing one.

The password will be saved in `/Apollo/.pwd` and the address will be saved in `/Apollo/testnet.env`.

Complete the setup helper. This will then start the node and begin syncing.

### Setting up a masternode with an existing masternode address (importing)

Run `bash apollo.sh import` and follow the steps.

### Connecting to our network with MetaMask

You will need to go to https://master.rupaya.io/

There you must click the `login`button. If you use metamask, you need to connect to a custom network first

```
RPC URL: https://socket.rupaya.io:7050
Chain ID: 308
Symbol RUPX
Nickname RUPAYA
```

### Run latest dev branch

```
cd && git clone https://github.com/rupayaproject/go-rupaya && cd go-rupaya && git checkout rebrand && make rupaya && sudo rm  /usr/local/bin/rupaya && sudo cp build/bin/rupaya /usr/local/bin
```

To return to the stable version:

```
cd && cd go-rupaya && git checkout master && make rupaya && sudo rm  /usr/local/bin/rupaya && sudo cp build/bin/rupaya /usr/local/bin
```

---

## Common issues

Note: You might need `sudo` permissions to run any commands below.

On first install: `chmod: changing permissions of FILE/DIR denied`: rerun `chmod -R 755 Apollo` with `sudo` permissions.

`permission denied` when running `.sh` files: First execute `chmod +x FILE_NAME` to grant permissions

When updating via `git pull`: `error: Your local changes to the following files would be overwritten by merge:` Stash the local changes made by the `chmod` action by executing `git stash` first.

## Upgrading go-rupaya

Whenever new updates are available, please run `bash upgrade-rupaya.sh`.

## Upgrade Apollo

`cd && rm -rf Apollo && git clone https://github.com/rupayaproject/Apollo && chmod -R 755 Apollo/ && cd Apollo`

This will remove the repository and reinstall it completely.

## Known bugs

After creating the initial account, chances are likely that your node will start without unlocking the account first. Until this is fixed, we recommend you, after first run, to stop the node and restart it. Check the logs to confirm it's running!.
