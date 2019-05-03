# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle :compinstall filename '~/.zsh/.zshrc'
autoload -Uz compinit; compinit

if [[ -x $(command -v dircolors) && ~/.dircolors ]]; then
    eval $(dircolors ~/.dircolors)
fi

# Zplug-stuff
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-history-substring-search"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# SSH agent 
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

# Some settings are stored as separate files in the
# folder below. This to avoid clutter in this file.
for file in ~/.zsh/modules/*
do
    . ${file}
done

# This makes the delete key work as expected in zsh.
bindkey "^[[3~"     delete-char
bindkey "^[3;5~"    delete-char

# Let's make a pretty prompt!!
# Custom characters are listed in man zshmisc
# Basic look without colours is:
# BLANK LINE
# [user@host ~/working_directory]
# > INPUT
PS1="
%B%F{green}[%f%b%F{cyan}%n%f%B%F{green}@%f%b%F{blue}%M%f %F{yellow}%~%f%B%F{green}]%f%b
%B%F{8}> %f%b"

