# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Setup bash prompt and Add colour

# https://askubuntu.com/questions/730754/how-do-i-show-the-git-branch-with-colours-in-bash-prompt
# https://digitalfortress.tech/tutorial/setting-up-git-prompt-step-by-step/
# __git_ps1 is included here /usr/lib/git-core/git-sh-prompt by default.
# There is no need to clone from https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

# __git_ps1 configuration options. 
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_HIDE_IF_PWD_IGNORED=true
# GIT_PS1_SHOWCOLORHINTS=true

# colour codes: https://gist.github.com/vratiu/9780109
Reset="\[\033[0m\]"           # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White
Magenta="\[\033[0;35m\]"      # Magenta

# Bold
BBlack="\[\033[1;30m\]"       # Bold Black
BRed="\[\033[1;31m\]"         # Bold Red
BGreen="\[\033[1;32m\]"       # Bold Green
BYellow="\[\033[1;33m\]"      # Bold Yellow
BBlue="\[\033[1;34m\]"        # Bold Blue
BPurple="\[\033[1;35m\]"      # Bold Purple
BCyan="\[\033[1;36m\]"        # Bold Cyan
BWhite="\[\033[1;37m\]"       # Bold White
BMagenta="\[\033[1;35m\]"     # Bold Magenta

function prompt_char {
  if [ $UID -eq 0 ]; then
    # different char if root
    echo "$BRed√"
  elif [[ -n $SSH_CONNECTION ]]; then
    echo "$BMagenta∴"
  else
    echo "$BRed>>"
  fi
}

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' # original
    PS1="$BYellow[\t] $Reset${debian_chroot:+($debian_chroot)}$BGreen\u@\h$Reset:$BBlue\w$BRed\$(__git_ps1) $BYellow\n $(prompt_char)$Reset "

    # Colorize man pages
    # https://drasite.com/blog/Pimp%20my%20terminal#man-pages
    export LESS_TERMCAP_mb=$'\e[1;32m'
    export LESS_TERMCAP_md=$'\e[1;32m'
    export LESS_TERMCAP_me=$'\e[0m'
    export LESS_TERMCAP_se=$'\e[0m'
    export LESS_TERMCAP_so=$'\e[01;33m'
    export LESS_TERMCAP_ue=$'\e[0m'
    export LESS_TERMCAP_us=$'\e[1;4;31m'
    
else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ' # original
    PS1='[\t] ${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1) \n$(prompt_char)'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# source repo aliases
if [ -f ~/.dotfiles/.bash_aliases ]; then
    . ~/.dotfiles/.bash_aliases
fi

# source any aliases if they exist on the local machine only
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# source any bashrc script if only local
if [ -f ~/.dotfiles/.bashrc_local ]; then
    . ~/.dotfiles/.bashrc_local
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ROS Kinetic
if [ -f /opt/ros/kinetic/setup.bash ]; then
    source /opt/ros/kinetic/setup.bash
    # Note: this causes conflicts in using `OpenCV` with python3 in a `venv`:
fi
# ROS2 Galactic - MTE 544
if [ -f /opt/ros/galactic/setup.bash ]; then
    source /opt/ros/galactic/setup.bash
    export TURTLEBOT3_MODEL=burger
    source /usr/share/colcon_cd/function/colcon_cd.sh
    export _colcon_cd_root=/opt/ros/galactic/
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
    # Added from Lab 1
    export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
    export FASTRTPS_DEFAULT_PROFILES_FILE=$HOME/.home_fastdds.xml
    # echo -e "\e[31mDon't forget to set ROS_DOMAIN_ID\e[39m"
    export ROS_DOMAIN_ID=4 # robot 4
fi
if [ -f ~/catkin_ws/devel/setup.bash ]; then
    source ~/catkin_ws/devel/setup.bash
fi
if [ -f ~/integration/devel/setup.bash ]; then
    source ~/integration/devel/setup.bash
fi

# powerline breadcrumbs on left
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi
# Homebrew
if [ -d "/home/linuxbrew/.linuxbrew/bin/" ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# OpenVINO
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/computer_vision_sdk/deployment_tools/inference_engine/external/omp/lib:/opt/intel/computer_vision_sdk/deployment_tools/inference_engine/external/mkltiny_lnx/lib:/opt/intel/computer_vision_sdk/deployment_tools/inference_engine/lib/ubuntu_16.04/intel64:~/inference_engine_samples_build/intel64/Release/lib
# source /opt/intel/openvino/bin/setupvars.sh


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# CONDA
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/abhi/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/abhi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/abhi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/abhi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# deactivate base environment
conda deactivate

# Adding ~/.dotfiles/bin to PATH
#####################################
# Inspired by camspiers' dotfiles at https://github.com/camspiers/dotfiles/

# Joins paths together by ":"
# Arguments:
#     $1: Array of paths, e.g. join ARR[@]
# Returns:
#     string
join_paths() { a=("${!1}"); local IFS=":"; echo "${a[*]}"; }

# Deduplicates paths separated by ":"
# Arguments:
#     $1: string of paths separated by ":"
# Returns:
#     string
dedup_paths() { echo -n $1 | awk -v RS=: -v ORS=: '!arr[$0]++'; }

# User paths
USER_PATHS=(
  "$HOME/.dotfiles/bin" # Personal scripts
)

# Set PATH with ordering: PATH:USER
export PATH=$(dedup_paths "$PATH:$(join_paths USER_PATHS[@])")

# Delete functions so they can't be called by a user when the terminal has opened
unset join_paths
unset dedup_paths
