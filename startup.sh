#!/bin/bash

touch .bashrc

# install nvm
wget -q https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh
chmod a+x ./install.sh && ./install.sh

# clean up
rm ./install.sh

# run vscode
/usr/share/code/code
