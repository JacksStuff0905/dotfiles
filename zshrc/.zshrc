# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="%n@%m %1~ %#"


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
  eval "$(starship init zsh)"
fi

# Custom theme
if [[ -f "$HOME/.current-theme-rc" || -L "$HOME/.current-theme-rc" ]]; then
  zsh "$HOME/.current-theme-rc"
fi
