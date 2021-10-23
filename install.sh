#!/usr/bin/env bash
# This script will set up all the symlinks necessary, installing the dotfiles for the current
# user.
dotfiles_dir="$(readlink -f "$(dirname "$0")")"

# If set to true, symlinks will be done using the -f flag when the target file exists.
force_replace=true
dry_run=true

# Helper method for symlinking with custom error messages.
symlink() {
  target="$1"
  target_basename=$(basename "$target")
  destination="$2"/"$target_basename"

  if ! git ls-files --error-unmatch "$target" &> /dev/null; then
    return 1 # File is not tracked by git
  fi

  if [ ! -e "$destination" ]; then
    printf_green '[LINK]  '
    echo "'$target' => '$destination'"
    $dry_run || ln -s "$target" "$destination"
  elif "$force_replace"; then
    printf_yellow '[FORCE] '
    echo "'$target' => '$destination'"
    $dry_run || ln -sf "$target" "$destination"
  else
    printf_red '[ERROR] '
    echo "Can not symlink $target to $destination, file already exists"
    return 1
  fi

  return 0
}

crystal_install() {
  program="$1"
  destination="$2"

  source_file="$dotfiles_dir/src/$1.cr"

  echo_blue " => $program.cr "

  if [ ! -e "$target" ]; then
    printf_red '[ERROR] '
    echo "Can not build $target, file does not exist!"
    return 1
  fi

  crystal build "$source_file" -o "$destination/$program"
}

printf_red() { tput setaf 1; printf '%s' "$@"; tput sgr0; }
printf_green() { tput setaf 2; printf '%s' "$@"; tput sgr0; }
printf_yellow() { tput setaf 3; printf '%s' "$@"; tput sgr0; }
echo_green() { tput setaf 2; echo "$@"; tput sgr0; }
echo_blue() { tput setaf 4; echo "$@"; tput sgr0; }

########
echo_blue "~~~ w3lc0m3 t0 T3rm1n4lN0d3's 1337 1n5t4ll 5crypt!!1! ~~~"
$dry_run && echo_green 'Dry run is enabled (but .desktop files will still be installed)'
echo

########
echo_blue 'Symlinking files to be placed in ~/'
home_files=('.ghci' '.vimrc' '.zshenv' 'bruh')
for file in "${home_files[@]}"; do
  symlink "$dotfiles_dir/$file" "$HOME"
done
echo

########
echo_blue 'Symlinking files to be placed in ~/.local/bin'
for file in $(find "$dotfiles_dir/.local/bin" -mindepth 1); do
  symlink "$file" "$HOME/.local/bin"
done
echo

########
# Desktop files are numerous and not very important,
# so I'm just gonna link them with no regard for safety. :-) #YOLO
echo_blue 'Installing desktop files to ~/.local/share/applications'
desktop_file_dir="$HOME/.local/bin/share/applications"
echo_blue '...done!'
echo

[ ! -e "$desktop_file_dir" ] && mkdir -pv "$desktop_file_dir"
if [ ! -d "$desktop_file_dir" ]; then
  printf_red '[ERROR] '
  echo "Can not install desktop files because '$desktop_file_dir' exists, but is not a directory"
else
  for file in $(find "$dotfiles_dir/.local/share/applications" -mindepth 1); do
    ln -fs "$file" "$desktop_file_dir"
  done
fi

########
echo_blue 'Installing remaining files to be placed in ~/.local/share'
symlink "$dotfiles_dir/.local/share/mpv-logo.png" "$HOME/.local/share/"

for file in $(find "$dotfiles_dir/.local/share/qutebrowser/greasemonkey" -mindepth 1); do
  echo "$file"
  symlink "$file" "$HOME/.local/share/qutebrowser/greasemonkey"
done
echo

########
echo_blue 'Compiling and installing sources (final step!)'
crystal_install 'decimal_time' "$HOME/.local/bin"

########
echo
tput setaf 1
echo "Script has finished, but is still a WIP!"
echo "~/.config has yet to be installed. :-("
tput sgr0
exit 1
