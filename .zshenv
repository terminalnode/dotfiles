# Opt out of Microsoft spyware
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# Disable oh-my-zsh would you like to update
export DISABLE_UPDATE_PROMPT=true

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Add stuff to path.
export PATH="$XDG_DATA_HOME/node_modules/bin:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.dotnet/tools/:$PATH"

# Moving stuff to XDG_CONFIG_HOME
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export RBENV_ROOT="$XDG_CONFIG_HOME/rbenv"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export XCOMPOSEFILE="$XDG_CONFIG_HOME/XCompose"
export MPV_HOME="$XDG_CONFIG_HOME/mpv"

# Moving stuff to XDG_DATA_HOME
export UNISON="$XDG_DATA_HOME/unison"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export GEM_HOME="$XDG_DATA_HOME/gem"
export npm_config_prefix="$XDG_DATA_HOME/node_modules"

# Moving stuff to XDG_CACHE_HOME
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# bat theme
export BAT_THEME="Monokai Extended Bright"
source "/home/terminal/.local/share/cargo/env"
