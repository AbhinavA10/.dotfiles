#uw vpn
alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

#python venvs
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

#ros
alias cm='catkin_make'
alias sd='source /opt/ros/kinetic/setup.bash && source ~/catkin_ws/devel/setup.bash'
alias si='source /opt/ros/kinetic/setup.bash && source ~/integration/devel/setup.bash'
alias rosbag_record_processing_input='rosbag record /object_detection /obstacle_detection /traffic_light_detection /traffic_sign_detection /navsat/odom /processing/hd_map /processing/roadline_post_processing'
