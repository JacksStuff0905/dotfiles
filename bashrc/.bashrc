#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Yazi cd functionality
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Custom
if type kitten &> /dev/null; then
  alias icat='kitten icat'
fi

# Env
if type nvim &> /dev/null; then
  export EDITOR="$(which nvim)"
fi

# Starship prompt:
if type starship &> /dev/null; then
  eval "$(starship init bash)"
fi


# Godot neovim integration
function ngd() {
  pkill -f "^nvim --listen /tmp/godot.pipe"

  if [[ -z "$1" ]]; then
    $(which godot) &> /dev/null &
    nvim --listen /tmp/godot.pipe
  else
    $(which godot) -e "$1" &> /dev/null &
    nvim --listen /tmp/godot.pipe "$1"
  fi
}

if type zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi


# Custom theme
if [[ -f "$HOME/.current-theme-rc" || -L "$HOME/.current-theme-rc" ]]; then
  bash "$HOME/.current-theme-rc"
fi
