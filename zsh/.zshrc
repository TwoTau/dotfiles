# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -Uz compinit promptinit
compinit
promptinit
kitty + complete setup zsh | source /dev/stdin

setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt GLOB_COMPLETE

prompt bart

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm" # The AUR package installs it to here.
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh" # Load NVM

# if [[ $(tty) =~ "/dev/tty" ]]; then
# 	neofetch --colors 4 7 4 1 7 7
# fi

export DOTDIR="$HOME/dotfiles"

source $HOME/.aliases
source $DOTDIR/zsh/.zshkeybinds
