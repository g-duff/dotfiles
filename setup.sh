#!/bin/bash

CONFIG_MESSAGE='Link to personal config'
CONFIG_FILES_DIRECTORY=$(pwd)

setup_zsh() {
    config_location=~/.zshrc
    echo "# ${CONFIG_MESSAGE}" >> ${config_location}
    echo "source ${CONFIG_FILES_DIRECTORY}/aliases.sh" >> ${config_location}
    echo "source ${CONFIG_FILES_DIRECTORY}/.zshrc" >> ${config_location}
}

setup_neovim() {
    ln -s $PWD/nvim ~/.config/
}

setup_zsh

[[ -d ~/.config ]] && setup_neovim
