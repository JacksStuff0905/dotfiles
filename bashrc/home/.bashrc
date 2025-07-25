#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '



# Custom
alias icat='kitten icat'

# Env
export EDITOR="$(which nvim)"

# Starship prompt:
eval "$(starship init bash)"

# Custom theme
bash $HOME/.current-theme-rc
