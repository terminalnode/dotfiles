# This file only contains the bare basics, most settings are separated into
# multiple files in the ./modules directory. These are loaded at the bottom
# of this script.

# Install and configure oh-my-zsh
export ZSH="$HOME/.config/zsh/oh-my-zsh"
if [[ ! -d "$ZSH" ]]; then
  echo 'Oh my zsh is not present, fetching it!'
  git clone 'https://github.com/ohmyzsh/ohmyzsh.git' "$ZSH"
  cp "$HOME/.dotfiles/.config/zsh/oh-my-zsh-themes"/* "$ZSH/themes"
fi

if [[ -d "$ZSH" ]]; then
  ZSH_THEME="terminalarbetare"
  CASE_SENSITIVE="true"
  HYPHEN_INSENSITIVE="true"
  COMPLETION_WAITING_DOTS="true"
  DISABLE_UNTRACKED_FILES_DIRTY="true"

  # Uncomment the following line to automatically update without prompting.
  # DISABLE_UPDATE_PROMPT="true"

  # Uncomment the following line to enable command auto-correction.
  # ENABLE_CORRECTION="true"

  plugins=(
    git
    archlinux
    terraform
    gradle
    aws
    colored-man-pages
    vi-mode
  )
  source $ZSH/oh-my-zsh.sh
fi

# History configuration
mkdir -p ~/.cache/zsh/
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_GLOB
HISTORY_IGNORE='(:)#q|exit|l[lsa]( *)#|e[l]#( *)#|lsblk|df( *)#|du( *)#|mpv *|imv *|man *|rm *|cd ..|mv *'
HISTORY_IGNORE='git status( *)#|git rebase( *)#|gits( *)#|gitr( *)#|pm( *)|'$HISTORY_IGNORE
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Activate dircolors if installed and configured
if [[ -x $(command -v dircolors) && ~/.dircolors ]]; then
  eval $(dircolors "$XDG_CONFIG_HOME/dircolors")
fi


# Load all the files in ./modules
for file in $ZDOTDIR/modules*/*
do
  source ${file}
done

# This makes the delete key work as expected in zsh.
bindkey "^[[3~"     delete-char
bindkey "^[3;5~"    delete-char

# Java
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
