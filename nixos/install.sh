#!/usr/bin/env sh
# Simply copy the files of this directory to /etc/nixos.
# If a file in /etc/nixos is no longer here it will remain,
# but since configuration.nix is the file being read this
# doesn't really matter much.

origin="${HOME}/.dotfiles/nixos"
destination="/etc/nixos"

if [ -d "${origin}" ]; then
  sudo cp -rf "${origin}" "${destination}"
  sudo nixos-rebuild switch
else
  echo
  echo "## TRAGEDY STRIKES! ##"
  echo "Could not find '${origin}'," &&
  echo "please check that your dotfiles are in the right place." &&
  exit 1
fi
