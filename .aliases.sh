# Notes:
# Aim for key strikes with alternate hands on qwerty keyboard.

function chtsh () {
	lang=$1
	shift
	query=$@
	curl http://cht.sh/$lang/${query// /+} | less --RAW-CONTROL-CHARS
}


# List
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias llh='ls -lh'


# Vim
alias vim='nvim'
alias nv='nvim'


# Git
alias g='git'
alias gg='git status'
alias gh='git checkout'
alias gi='git diff'
alias gis='git diff --staged'
alias gk='git commit' # kommit
alias gka='git commit --amend'
alias gkan='git commit --amend --no-edit'
alias gl='git log'
alias gn='git branch'
alias gnc="git branch | sed -n 's/\* //p'"
alias gp='git add' # put
alias gr='git rev-parse --show-toplevel'

alias ghs='git push'
alias gll='git pull'


# Github
function github_repo_url() {
	git config --get remote.origin.url | sed -E 's/.*github.com[:/](.*).git/https:\/\/github.com\/\1/'
}

alias gho='open $(github_repo_url)'
alias ghod='open $(github_repo_url)/compare/$(gnc)'

