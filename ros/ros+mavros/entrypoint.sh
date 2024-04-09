#!/bin/bash


printf "Entering docker tmux session"
sleep 2

tmux new-session -d -s mysession
tmux send-keys -t mysession "source /opt/ros/kinetic/setup.bash ; roscore" Enter    # 1:1
tmux split-window -h -t mysession
tmux send-keys -t mysession "source /opt/ros/kinetic/setup.bash ; sleep 5;  roscd mavros ; roslaunch mavros px4.launch fcu_url:=/dev/ttyACM0:57600 " Enter    #1:2
tmux split-window -v -p 50 -t mysession
tmux send-keys -t mysession "source /opt/ros/kinetic/setup.bash ; " Enter     #2:2
tmux select-pane -t mysession:0.0
tmux split-window -v -p 50 -t mysession
tmux send-keys -t mysession "source /opt/ros/kinetic/setup.bash ; " Enter      #2:1
tmux select-pane -t mysession:0.0
# Attach to session 
tmux attach -t mysession

