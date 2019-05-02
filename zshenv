# This file is sourced all the time and needs to be kept short.
export ZDOTDIR="$HOME/.zshconf"

# Add stuff to path.
if [[ -d "$HOME/.cargo" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
if [[ -d "$HOME/.scripts" ]]; then
    export PATH="$HOME/.scripts:$PATH"
fi
if [[ "Darwin" = $(uname) ]]; then
    export PATH="/usr/local/bin:$PATH"
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    echo "helloooo"
fi

# Pyenv initialization
# (adding pyenv to path)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
