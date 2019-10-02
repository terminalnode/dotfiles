# History configuration
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Activate dircolors if installed and configured
if [[ -x $(command -v dircolors) && ~/.dircolors ]]; then
    eval $(dircolors ~/.dircolors)
fi

# Activate syntax highlighting if it exists
if [[ -n /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Let's make a pretty prompt!! Custom characters are listed in man zshmisc
# BLANK LINE
# [user@host ~/working_directory]
# > 
PS1="
%B%F{green}[%f%b%F{cyan}%n%f%B%F{green}@%f%b%F{blue}%M%f %F{yellow}%~%f%B%F{green}]%f%b
%B%F{8}> %f%b"

# Autocompletion settings
autoload -U compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

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
