#!/usr/bin/env bash
# This script will set up all the symlinks necessary, installing the dotfiles for the current user.
dotfiles_dir="$(readlink -f "$(dirname "$0")")"
echo Dotfiles dir: "$dotfiles_dir"

# Options. These will be togglable using flags at some point, probably.
force_replace=true
dry_run=false
compile_scripts=true

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
    if ! $dry_run; then
      rm -fr "$destination"
      ln -s "$target" "$destination"
    fi
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

go_install() {
  program="$1"
  destination="$2"
  source_file="$dotfiles_dir/src/$1.go"

  echo_blue " => $program.go "

  if [ ! -e "$target" ]; then
    printf_red '[ERROR] '
    echo "Can not build $target, file does not exist!"
    return 1
  fi

  go build -o "$destination/$program" "$source_file"
}

printf_red() { tput setaf 1; printf '%s' "$@"; tput sgr0; }
printf_green() { tput setaf 2; printf '%s' "$@"; tput sgr0; }
printf_yellow() { tput setaf 3; printf '%s' "$@"; tput sgr0; }
echo_red() { tput setaf 1; echo "$@"; tput sgr0; }
echo_green() { tput setaf 2; echo "$@"; tput sgr0; }
echo_blue() { tput setaf 4; echo "$@"; tput sgr0; }

########
echo_blue "~~~ w3lc0m3 t0 T3rm1n4lN0d3's 1337 1n5t4ll 5crypt!!1! ~~~"
dependencies=('rsync')
any_dep_failed=false
for dependency in "${dependencies[@]}"; do
  printf 'Checking dependency "%s": ' "$dependency"
  if ! command -v "$dependency" &> /dev/null; then
    echo_red 'MISSING'
    any_dep_failed=true
  else
    echo_green 'OK'
  fi
done
$any_dep_failed && exit 1

$dry_run && echo_green 'Dry run is enabled (but .desktop files will still be installed)'
echo

########
echo_blue 'Symlinking files to be placed in ~/'
home_files=('.ghci' '.vimrc' '.zshenv')
for file in "${home_files[@]}"; do
  symlink "$dotfiles_dir/$file" "$HOME"
done
echo

########
echo_blue 'Symlinking files to be placed in ~/.local/bin'
for file in $(find "$dotfiles_dir/.local/bin" -mindepth 1 -maxdepth 1); do
  symlink "$file" "$HOME/.local/bin"
done
echo

########
# Desktop files are numerous and not very important,
# so I'm just gonna link them with no regard for safety. :-) #YOLO
echo_blue 'Installing desktop files to ~/.local/share/applications'
desktop_file_dir="$HOME/.local/share/applications"
echo_blue '...done!'
echo

[ ! -e "$desktop_file_dir" ] && mkdir -pv "$desktop_file_dir"
if [ ! -d "$desktop_file_dir" ]; then
  printf_red '[ERROR] '
  echo "Can not install desktop files because '$desktop_file_dir' exists, but is not a directory"
else
  for file in $(find "$dotfiles_dir/.local/share/applications" -mindepth 1 -maxdepth 1); do
    ln -fs "$file" "$desktop_file_dir"
  done
fi

########
echo_blue 'Installing remaining files to be placed in ~/.local/share'
symlink "$dotfiles_dir/.local/share/mpv-logo.png" "$HOME/.local/share"

for file in $(find "$dotfiles_dir/.local/share/qutebrowser/greasemonkey" -mindepth 1 -maxdepth 1); do
  symlink "$file" "$HOME/.local/share/qutebrowser/greasemonkey"
done
echo

########
echo_blue '.config directory (files)'
config_dir="$HOME/.config"
for file_path in $(find "$dotfiles_dir/.config/" -mindepth 1 -maxdepth 1 -type f); do
  symlink "$file_path" "$config_dir"
done
echo

########
echo_blue '.config directory (folders)'
echo_blue 'Folder by folder we will symlink from dotfiles dir to .config'
echo_blue 'Step 1. Copy files not in dotfiles version of folder from .config folder (if present)'
echo_blue 'Step 2. Delete original folder and symlink dotfiles version'
printf 'Press any key to confirm that you understand, or ^C to abort :-)'
read
for dot_dir_path in $(find "$dotfiles_dir/.config/" -mindepth 1 -maxdepth 1 -type d); do
  dir_name=$(basename "$dot_dir_path")
  real_dir_path="$HOME/.config/$dir_name"

  if [ -e "$real_dir_path" ]; then
    if $dry_run; then
      rsync --recursive --links --ignore-existing --dry-run  "$real_dir_path" "$dot_dir_path/.."
    else
      rsync --recursive --links --ignore-existing "$real_dir_path" "$dot_dir_path/.."
    fi
  fi

  symlink "$dot_dir_path" "$config_dir"
done
echo

########
if $compile_scripts; then
  echo_blue 'Compiling and installing sources (final step!)'
  go_install 'decimal_time' "$HOME/.local/bin"
else
  echo_blue 'Compile scripts is not toggled, skipping this step'
fi
