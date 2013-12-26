#!/bin/bash

cd ./bundle/tern_for_vim/;npm install
cd ./bundle/YouCompleteMe/;./install.sh

vim +BundleUpdate

