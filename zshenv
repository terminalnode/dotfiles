# This file is sourced all the time and needs to be kept short.
export ZDOTDIR="$HOME/.zshconf"

# Pyenv initialization
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
