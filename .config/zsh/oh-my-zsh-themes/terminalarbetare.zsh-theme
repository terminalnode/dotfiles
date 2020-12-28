#!/usr/bin/env zsh
# Little green bracket for the end of the prompt
green_start_bracket() {
  echo '%B%F{green}[%b%f'
}

# Little green bracket for the start of the prompt
green_stop_bracket() {
  echo '%B%F{green}]%b%f'
}

# Time display when everything's normal
current_time_ok() {
  echo '%F{yellow}%*%f'
}

# Time display when an error occurred
current_time_err() {
  echo '%F{red}%*%f'
}

# Current time ok if exit status ok, otherwise current time err
current_time() {
  echo "%B%(?.$(current_time_ok).$(current_time_err))%b"
}

# Username @ Hostname
username() {
  echo "%F{cyan}%n%f%B%F{green}@%f%b%F{blue}%M%f"
}

# Current directory in yellow
directory() {
  echo "%F{yellow}%~%f"
}

# Terraform prompt
tf_prompt() {
  info=$(tf_prompt_info)
  if [[ ! -z "$info" ]]; then
    echo " %F{yellow}${info}%f"
  fi
}

# gray > in front of next command
prompt_indicator() {
  echo '%B%F{8}> %f%b'
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='
$(current_time) $(green_start_bracket)$(username) $(directory)$(green_stop_bracket)
$(prompt_indicator)'
RPROMPT='$(git_prompt_status) %F{magenta}$(git_prompt_info)%f$(tf_prompt)'
