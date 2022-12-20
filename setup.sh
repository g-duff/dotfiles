#!/bin/bash

CONFIG_MESSAGE='Link to personal config'
CONFIG_FILES_DIRECTORY=$(pwd)

setup_zsh() {
    config_location=~/.zshrc
    echo ${CONFIG_MESSAGE} >> ~
    echo "source ${CONFIG_FILES_DIRECTORY}/aliases.sh" >> ${config_location}
    echo "source ${CONFIG_FILES_DIRECTORY}/.zshrc" >> ${config_location}
}

setup_bash() {
    config_location=~/.bashrc
    echo ". ${CONFIG_FILES_DIRECTORY}/aliases.sh" >> ${config_location}
    echo ". ${CONFIG_FILES_DIRECTORY}/.bashrc" >> ${config_location}
}

setup_neovim() {
    ln -s $PWD/nvim ~/.config/nvim
}

[[ -f ~/.zshrc ]] && setup_zsh

[[ -f ~/.bashrc ]] && setup_bash

[[ -d ~/.config ]] && setup_neovim
