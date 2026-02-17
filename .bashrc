#
# ~/.bashrc
#

[[ $- != *i* ]] && return # If not running interactively, don't do anything
eval "$(starship init bash)"
export TERM=xterm-256color

PATH=$PATH:~/Android/Sdk/platform-tools/
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
HISTFILESIZE=
HISTSIZE=

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias copy='wl-copy < '
alias open='xdg-open'
PS1='[\u@\h \W]\$ '

source "$HOME/.config/pokimon/random_pokimon.sh"
source "$HOME/.config/wttr/wttr.sh"
source "$HOME/.config/kys/kys.sh"

export AII="$HOME/Documents/Cuarto/segundo_cuatri/AII/"
export RO="$HOME/Documents/Cuarto/segundo_cuatri/RO/"
export PI="$HOME/Documents/Cuarto/segundo_cuatri/PI/"
export TFG="$HOME/Documents/Cuarto/TFG/"

random_pokimon
