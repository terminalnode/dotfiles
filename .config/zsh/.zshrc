# This file only contains the bare basics, most settings are separated into
# multiple files in the ./modules directory. These are loaded at the bottom
# of this script.

# Set JAVA_HOME here because I don't wanna log out to change it
JAVA_HOME="$HOME/.jdks/corretto-21.0.2"

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

# This must be at the end of the file for SDK-MAN to work!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
