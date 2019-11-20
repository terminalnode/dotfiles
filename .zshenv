# This file is sourced all the time and needs to be kept short.
export ZDOTDIR="$HOME/.zsh"

# Add stuff to path.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# bat theme
export BAT_THEME="Monokai Extended Bright"

# Java
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"

# Pyenv initialization
# (adding pyenv to path)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ -n "${PYENV_ROOT}" ]]; then
  eval "$(pyenv init -)"
  if [[ -d "${PYENV_ROOT}/plugins/pyenv-virtualenv" ]] 1>/dev/null 2>&1; then
      eval "$(pyenv virtualenv-init -)"
  fi
fi
