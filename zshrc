# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit; compinit
eval $(dircolors ~/.dircolors)

# Zplug-stuff
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-history-substring-search"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# Most settings are stored in their own
# files in .zsh_settings to avoid clutter.
# This imports those files and includes:
# exports, aliases, colorized_man_pages
for file in ~/.zshstuff/*
do
    . ${file}
done

# Pyenv initialization
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# This makes the delete key work as expected in zsh.
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# Let's make a pretty prompt!!
# Custom characters are listed in man zshmisc
# Basic look without colours is:
# BLANK LINE
# [user@host ~/working_directory]
# > INPUT
PS1="
%B%F{green}[%f%b%F{cyan}%n%f%B%F{green}@%f%b%F{blue}%M%f %F{yellow}%~%f%B%F{green}]%f%b
%B%F{8}> %f%b"

