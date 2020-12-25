# This file only contains the bare basics, most settings are separated into
# multiple files in the ./modules directory. These are loaded at the bottom
# of this script.

# Install and configure oh-my-zsh
export ZSH="$HOME/.config/zsh/oh-my-zsh"
if [[ ! -d "$ZSH" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Remove themes directory and replace it with symlink of our own
  rm -fr "$ZSH/themes"
  ln -sf "$HOME/.dotfiles/.config/zsh/oh-my-zsh-themes" "$ZSH/themes"

  # Remove oh my zsh zshrc and any pre-oh-my-zsh bullshit
  rm "$HOME/.zshrc*"
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
