# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias diff='diff --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ROS aliases
alias source_ros='source /opt/ros/galactic/local_setup.bash && source ~/apps/logging/local_setup.bash && source ~/apps/image_common/local_setup.bash && source ~/apps/asi_interfaces/local_setup.bash'
source_ros

# VAI aliases
alias svai='source ./vai/local_setup.bash'
alias bag='ros2 bag'
alias bagrecord='ros2 bag record --storage mcap -a -o rosRecord'
alias baginfo='ros2 bag info --storage mcap rosRecord'
alias bagplay='ros2 bag play --storage mcap'
#alias bagrate='ros2 service call /rosbag2_player/set_rate rosbag2_interfaces/srv/SetRate'
alias pbag='ros2 service call /rosbag2_player/toggle_paused rosbag2_interfaces/srv/TogglePaused'

# VAI shell functions
ysplay() {
  ros2 bag play --storage mcap "$@" --topics /ouster_left/points /ouster_right/points /tf /tf_static /twist /robot_model /joint_states
}
fmplay() {
  ros2 bag play --storage mcap "$@" --topics  /front_lidar/points /tf /tf_static /twist /robot_model /joint_states
}

# some more ls aliases
# alias ll='ls -halF'
alias ll='ls -hlF'
alias la='ls -A'
alias l='ls -CF'

# Search Aliases
alias lkcpp="grep -rIn --exclude-dir=\*build\* --exclude-dir=\*.git\* --include \*.c --include \*.h --include \*.cpp --include \*.hpp"
alias lkpy="grep -rIn --exclude-dir=\*build\* --exclude-dir=\*.git\* --include \*.py" 
alias lkm="grep -rIn --exclude-dir=\*build\* --exclude-dir=\*.git\* --include \*.m" 
alias lkcmake="grep -rIn --exclude-dir=\*build\* --exclude-dir=\*.git\* --include CMakeLists.txt --include \*.cmake"
alias lkall="grep -rIn --exclude-dir=\*build\* --exclude-dir=\*.git\* "

# Code Analysis Tool Aliases
alias lizard="lizard --warnings_only --modified -T cyclomatic_complexity=10 -T nloc=100 -T parameter_count=7"

# Git Aliases
alias gitlg="git log --oneline -10"
alias gitclean="git gc; echo \"completed 'git gc': Other git cleanup commands are 'git fsck' and 'git prune'\""

# Tool Aliases
alias ipa="ip -c -4 --brief a"
alias df="df -h -x squashfs -x tmpfs -x devtmpfs -x vfat -T"
alias open='xdg-open'
alias copySshKey='ssh-copy-id -i /home/dwithers/.ssh/id_ed25519.pub'

# tmux Aliases
alias tmux="tmux -2"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# make it so I can use ctrl-s to do forward search in the terminal
#stty -ixon


