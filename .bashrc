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

alias AII=$HOME/Documents/Cuarto/segundo_cuatri/AII/
alias RO=$HOME/Documents/Cuarto/segundo_cuatri/RO/
alias PI=$HOME/Documents/Cuarto/segundo_cuatri/PI/
alias TFG=$HOME/Documents/Cuarto/TFG/

kys() {
	kitten icat /home/choped/Pictures/kys/kys.jpg
	mpv --no-video --really-quiet /home/choped/Pictures/kys/kys.mp3 &
	sleep 3
	poweroff
}

random_pokimon() {
    REGULAR_DIR="$HOME/Pictures/pokimon/regular"
    SHINY_DIR="$HOME/Pictures/pokimon/shiny"
    
    SHINY_PROBABILITY=20
    IMAGE_HEIGHT_CELLS=20
    HALF=6
    
    IMAGE_PATH=""
    RANDOM_NUM=$(($RANDOM % $SHINY_PROBABILITY + 1))
    
    if [ $RANDOM_NUM -eq 1 ] && [ -d "$SHINY_DIR" ]; then
        IMAGE_PATH=$(find -L "$SHINY_DIR" -maxdepth 1 -type f -name "*.png" | shuf -n 1)
        if [ -n "$IMAGE_PATH" ]; then
            echo "¡Ha aparecido un Pokémon **Shiny**!"
        fi
    elif [ -d "$REGULAR_DIR" ]; then
        IMAGE_PATH=$(find -L "$REGULAR_DIR" -maxdepth 1 -type f -name "*.png" | shuf -n 1)
    fi
    
    if [ -n "$IMAGE_PATH" ] && command -v kitten &> /dev/null; then
	clear
        kitten icat --place ${IMAGE_HEIGHT_CELLS}x${IMAGE_HEIGHT_CELLS}@0x0 --scale-up --align left --clear "$IMAGE_PATH"
        echo -en "\033[${HALF}B"
    elif [ ! -n "$IMAGE_PATH" ]; then
        echo "Error: No se encontró ninguna imagen en los directorios especificados."
    elif ! command -v kitten &> /dev/null; then
        echo "Advertencia: El comando 'kitten icat' no está disponible. ¿Estás usando Kitty?"
    fi
}

random_pokimon
