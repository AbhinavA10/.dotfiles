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
# Replace diff command with git diff
alias diff='git diff --no-index'
alias gg='git gui'

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
