# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Add stuff to path.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

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

# Moving stuff to XDG_CACHE_HOME
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

# bat theme
export BAT_THEME="Monokai Extended Bright"

# Java
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
