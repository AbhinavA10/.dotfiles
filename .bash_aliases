# General
# ------------------
# Copy email from gitconfig to clipboard, stripping new line characters with perl
alias email="git config --global user.email | perl -pe 'chomp' | xclip -selection clipboard"
# usage e.g: findfile "*.png"
alias findfile='find . -type f -name'
alias do_update='sudo apt update'
alias do_upgrade='sudo apt upgrade'
alias update="do_update && do_upgrade"
alias autoremove='sudo apt autoremove -y'
alias ll='ls -AlFh'

# Can't check for exa command directly, since brew is activated later in .bash_rc
if [ -f "/home/linuxbrew/.linuxbrew/bin/exa" ]; 
then
    # Only use exa if it is installed
    alias ls='exa --group-directories-first --icons'
    alias ll='exa -laF --header --group-directories-first --git --icons'
    alias tree='exa -T --group-directories-first --icons'
fi

# Replace diff command with git diff
alias diff='git diff --no-index'
alias gg='git gui'
# Replaces `:` with `_` in all mp4 files in current directory.
# This makes the filename Windows OS safe.
# Run this alias as `rename_files -n` For a dry run.
alias rename_files="rename 's/\:/_/g' *.mp4 -v"
# Run this alias as `limit <pid>`. The limit of 500 limits cpu usage of the process to 
# 62% * 8 cores
alias limit="cpulimit --limit=500 -p "


# University of Waterloo vpn
# ------------------
# alias vpn='/opt/cisco/anyconnect/bin/vpn'
# alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

# python3 venvs
# ------------------
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

# ROS Kinetic
# ------------------
# alias cm='catkin_make'
# alias sd='source /opt/ros/kinetic/setup.bash && source ~/catkin_ws/devel/setup.bash'
# alias si='source /opt/ros/kinetic/setup.bash && source ~/integration/devel/setup.bash'
# alias rosbag_record_processing_input='rosbag record /object_detection /obstacle_detection /traffic_light_detection /traffic_sign_detection /navsat/odom /processing/hd_map /processing/roadline_post_processing'
# alias rosbag_filter_processing_input='rosbag filter ped_walking.bag ped_walking_processing_input.bag "topic == '/object_detection' or topic == '/traffic_light_detection' or topic == '/obstacles_3d' or topic ==  '/traffic_signs_3d' or topic ==  '/processing/hd_map' or topic ==  '/navsat/odom' or topic ==  '/processing/roadline_post_processing'"'

# ROS2 Galactic
# ------------------
alias cm='colcon build --symlink-install'
alias sd='source /opt/ros/galactic/setup.bash && . ~/ros2_ws/install/local_setup.bash'

# Conda
# ------------------
alias ceu="conda env update"
alias cl="conda list"
alias ci="conda install"
alias cr="conda remove"
alias ca="conda activate"

# Linux processes
# ------------------
# For Finding program that is using a specific port
# useful when local server is running, but unsure from which process
alias find-port-app="lsof -i" 
# usage: `find-port-app :8080`

# Send SIGKILL signal to <PID>
alias sigkill="sudo kill -9"
# usage: `sigkill <PID>`

# systemd services
alias running_services='systemctl list-units  --type=service  --state=running'
alias active_services='systemctl list-units  --type=service  --state=active'
