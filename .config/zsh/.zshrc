# This file only contains the bare basics, most settings are separated into
# multiple files in the ./modules directory. These are loaded at the bottom
# of this script.

# History configuration
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Activate dircolors if installed and configured
if [[ -x $(command -v dircolors) && ~/.dircolors ]]; then
  eval $(dircolors "$XDG_CONFIG_HOME/dircolors")
fi

# Autocompletion settings
autoload -U compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
fpath=("$ZDOTDIR/completions" $fpath)
[ -d ~/.zsh/completions.local ] && fpath=("$ZDOTDIR/completions.local" $fpath)

# Load all the files in ./modules
for file in $ZDOTDIR/modules*/*
do
  source ${file}
done

# This makes the delete key work as expected in zsh.
bindkey "^[[3~"     delete-char
bindkey "^[3;5~"    delete-char
