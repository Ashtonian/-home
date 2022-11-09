#!/usr/bin/env bash
# Sourced from https://github.com/atomantic/dotfiles/blob/master/lib_sh/echos.sh

###
# some colorized echo helpers
# @author Adam Eivy
###

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# TODO: add ask -> to ask user and wrap with default
# TODO: add always ask -> to always ask user even when with assumed run

function ok() {
    echo -e "$COL_GREEN[ok]$COL_RESET "$1
}

function bot() {
    echo -e "\n$COL_GREEN\[._.]/$COL_RESET - "$1
}

function running() {
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function action() {
    echo -e "\n$COL_YELLOW[action]:$COL_RESET\n ⇒ $1..."
}

function warn() {
    echo -e "$COL_YELLOW[warning]$COL_RESET "$1
}

function error() {
    echo -e "$COL_RED[error]$COL_RESET "$1
}

#    printf " [✖] %s\n" "$1"
function print_error() {
    echo -e "$COL_RED [x] $COL_RESET "$1
}
# printf " [✔] %s\n" "$1"
function print_success() {
    echo -e "$COL_GREEN [✔] $COL_RESET "$1
}

function print_result() {

    if [ "$1" -eq 0 ]; then
        print_success "$2"
    else
        print_error "$2"
    fi

    return "$1"

}



# // TODO: --dry run options
# // TODO: add y/n prompt with default?
# // TODO: add file promp ie (where do you want to install?) with defaults
# // TODO: add whihch option with default

# https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays
# Auto loop, sanatized input https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script/27875395
# echo "Do you wish to install this program?"
# select yn in "Yes" "No"; do
#     case $yn in
#         Yes ) make install; break;;
#         No ) exit;;
#     esac
# done
