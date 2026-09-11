# Dotfiles

My personal dotfiles. Use at your own risk.


## Setup

Install dependencies:
* Install OS packages. OS-dependent 
  * Ubuntu (26): build-essential, curl, git, stow, zsh. Set zsh as default shell `chsh -s $(which zsh)`
  * macOS: xcode-select --install

* Install mise
* Clone dotfiles repo

Apply config:
* Fonts (`fonts.sh`)
* stow (`setup.sh`)
* `mise install`
