# systemd services
alias running_services='systemctl list-units  --type=service  --state=running'
alias active_services='systemctl list-units  --type=service  --state=active'

# short things
alias plz='sudo'

#uw vpn
# alias vpn='/opt/cisco/anyconnect/bin/vpn'
# alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

#python venvs
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

#ros
# alias cm='catkin_make'
# alias sd='source /opt/ros/kinetic/setup.bash && source ~/catkin_ws/devel/setup.bash'
# alias si='source /opt/ros/kinetic/setup.bash && source ~/integration/devel/setup.bash'
# alias rosbag_record_processing_input='rosbag record /object_detection /obstacle_detection /traffic_light_detection /traffic_sign_detection /navsat/odom /processing/hd_map /processing/roadline_post_processing'

# alias rosbag_filter_processing_input='rosbag filter ped_walking.bag ped_walking_processing_input.bag "topic == '/object_detection' or topic == '/traffic_light_detection' or topic == '/obstacles_3d' or topic ==  '/traffic_signs_3d' or topic ==  '/processing/hd_map' or topic ==  '/navsat/odom' or topic ==  '/processing/roadline_post_processing'"'

alias ceu="conda env update"
alias cl="conda list"
alias ci="conda install"
alias cr="conda remove"
alias ca="conda activate"