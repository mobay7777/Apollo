#! /bin/bash

WORK_DIR=$(pwd)

# declare our system commands
CMD_GO='go'
CMD_TOMOCHAIN='$HOME/go-rupaya/build/bin/rupaya'

### Internal installation scripts to be used by calling install_generic ###

internal_install_packages() {
  sudo apt-get update
  sudo apt-get install -y build-essential curl git nano
  echo build-essential curl git nano has been installed.
  sudo mkdir tmp/
}

internal_install_go() {
  sudo add-apt-repository ppa:longsleep/golang-backports
  sudo apt-get update
  sudo apt-get install golang-go -y
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
  echo Go 1.11.1 has been installed.
  cd $WORK_DIR
}

internal_install_go-rupaya() {
  cd $HOME
  git clone 'https://github.com/rupayaproject/go-rupaya'
  cd $HOME/go-rupaya && make all
  sudo cp $HOME/go-rupaya/build/bin/rupaya /usr/local/bin
  sudo cp $HOME/go-rupaya/build/bin/bootnode /usr/local/bin
  sudo cp $HOME/go-rupaya/build/bin/puppeth /usr/local/bin
  echo go-rupaya has been installed
  cd $WORK_DIR
}


### Execute installations below ###

command_exists() {
if type "$1" > /dev/null; then
  return 0
else
  return 1
fi
}

# Usage 'install_generic [NAME]'
install_generic () {
  case "$1" in
    go ) sys_command=$CMD_GO;;
    go-rupaya ) sys_command=$CMD_TOMOCHAIN;;
  esac

  if command_exists $sys_command
  then
    echo
    read -p "$1 is already installed. Override local installation?"
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      sudo rm -rf $sys_command
      internal_install_$1
    else
      echo Skip $1 installation
    fi
  else
    internal_install_$1
  fi
}


### Begin

internal_install_packages
install_generic go
install_generic go-rupaya
echo Installation completed. Please restart this terminal window for changes to take effect.
sudo rm -rf tmp/
bash --login; exit
