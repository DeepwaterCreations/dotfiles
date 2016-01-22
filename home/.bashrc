#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias camp='cp437 camp'
PS1='[\u@\h \W]\$ '

source "$HOME/.homesick/repos/homeshick/homeshick.sh"