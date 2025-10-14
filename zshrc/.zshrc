# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### --- PLUGINS --- ###
{
  ### Zinit Bootstrap
  if [[ ! -f ~/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}==> Installing Zinit...%f"
    command mkdir -p ~/.local/share/zinit && \
    command git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/zinit.git
  fi

  source ~/.local/share/zinit/zinit.git/zinit.zsh


  # 1. Enable mode-dependent cursor shapes
  export ZVM_CURSOR_STYLE_ENABLED=true
  export ZVM_VIINS_CURSOR_STYLE=beam
  export ZVM_VICMD_CURSOR_STYLE=block
  export ZVM_VISUAL_CURSOR_STYLE=block

  export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

  # 2. Optional: enable indicator in the right prompt
  export ZVM_MODE_CURSOR=true

  ### Plugins
  # Load the full-featured Vim-style line editor
  zinit light jeffreytse/zsh-vi-mode

} && clear

# Update alias
alias zshupdate='zinit self-update && zinit update -all'



### --- GENERAL --- ###

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="%n@%m %1~ %#"

## case insensitive path-completion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Fix delete writing '~' issue
bindkey "\e[3~" delete-char

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
  alias ssh='kitten ssh'
fi

# Env
if type nvim &> /dev/null; then
  export EDITOR="$(which nvim)"
fi

# Starship prompt:
if type starship &> /dev/null; then
  eval "$(starship init zsh)"
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
  eval "$(zoxide init zsh)"
fi

# Custom theme
if [[ -f "$HOME/.current-theme-rc" || -L "$HOME/.current-theme-rc" ]]; then
  zsh "$HOME/.current-theme-rc"
fi
