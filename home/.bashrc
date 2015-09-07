#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias camp='cp437 camp'
PS1='[\u@\h \W]\$ '

#Add ruby's bin to path so I can run gem executables:
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
