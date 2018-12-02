# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# Most settings are stored in their own
# files in .zsh_settings. This grants easy
# access to any other apps that might want
# to use them. ¯\_(ツ)_/¯

# These files include:
# exports
# aliases_[console/gui]
for file in ~/.zsh_settings/*
do
    . ${file}
done

# Pyenv initialization
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# This supposedly makes the delete key
# work as expected, i.e. forward delete
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# Let's make a pretty prompt.
# Custom characters in man zshmisc
if [ $(id -u) -eq 0 ];
then # root has a special prompt
	PS1="%B%F{red}[%n@%M]%f %3/ #%b "
else # normal users also have a special prompt
	PS1="%B%F{red}[%n@%M]%f %3~ $%b "
fi
