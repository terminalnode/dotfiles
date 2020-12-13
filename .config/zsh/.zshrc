# This file only contains the bare basics, most settings are separated into
# multiple files in the ./modules directory. These are loaded at the bottom
# of this script.
setopt EXTENDED_GLOB

# History configuration
mkdir -p ~/.cache/zsh/
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=100000
SAVEHIST=100000
HISTORY_IGNORE='(:)#q|exit|l[lsa]( *)#|e[l]#( *)#|lsblk|df( *)#|du( *)#|mpv *|imv *|man *|rm *|cd ..|mv *'
HISTORY_IGNORE='git add( *)|git status( *)#|git rebase( *)#|gits( *)#|gita( *)#|gitr( *)#|'$HISTORY_IGNORE
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
