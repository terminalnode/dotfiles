# This file only contains the bare basics, most settings are separated into
# multiple files in the ./modules directory. These are loaded at the bottom
# of this script.

# History configuration
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Activate dircolors if installed and configured
if [[ -x $(command -v dircolors) && ~/.dircolors ]]; then
    eval $(dircolors ~/.dircolors)
fi

# Autocompletion settings
autoload -U compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
fpath=("~/.zsh/completions" $fpath)
[ -d ~/.zsh/completions.local ] && fpath=("~/.zsh/completions.local" $fpath)

# Load all the files in ./modules
for file in ~/.zsh/modules*/*
do
    source ${file}
done

# This makes the delete key work as expected in zsh.
bindkey "^[[3~"     delete-char
bindkey "^[3;5~"    delete-char

# Pyenv initialization
# (adding pyenv to path)
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d "${PYENV_ROOT}" ]]; then
  eval "$(pyenv init -)"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

export RBENV_ROOT="$HOME/.rbenv"
if [[ -d "${RBENV_ROOT}" ]]; then
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi
