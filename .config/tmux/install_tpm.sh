#!/bin/bash
confdir="${XDG_CONFIG_HOME:-$HOME/.config}"
plugdir="${confdir}/tmux/plugins"
mkdir -p "$plugdir"

if [ ! -d "${plugdir}/tpm" ]; then
  echo "TPM is not installed, installing..."
  git clone https://github.com/tmux-plugins/tpm "${plugdir}/tpm"
fi
