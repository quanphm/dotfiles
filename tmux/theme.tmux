#!/usr/bin/env bash

# colours
BG="#090E13"
FG="#C5C9C7"
GRAY="#27272a"
YELLOW="#eab308"

# colours for ghostty
# BG="#181616"
# FG="#c8c093"
# GRAY="#27272a"
# YELLOW="#c4b28a"

tmux_set() {
  tmux set-option -gq "$1" "$2"
}

tmux_set status on
tmux_set status-position bottom
tmux_set status-style "bg=$BG,fg=$FG"
tmux_set status-interval 2

# Left side of status bar
tmux_set status-left-style "none"
tmux_set status-left-length 80
tmux_set status-left "#[fg=$FG,bg=$GRAY] #S #[fg=$GRAY,bg=$BG]"

# Right side of status bar
tmux_set status-right-style "none"
tmux_set status-right-length 140
tmux_set status-right "#[fg=$GRAY,bg=$BG,nobold,noitalics,nounderscore]#[fg=$FG,bg=$GRAY] #($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -i 2 -a 0) #[fg=$BG,bg=$GRAY]#[fg=$GRAY,bg=$BG,nobold,noitalics,nounderscore]#[fg=$FG,bg=$GRAY] %a %d %b  %H:%M "

# window
tmux_set status-justify left
tmux_set window-status-separator ""

tmux_set window-status-format " #I:#W "
tmux_set window-status-style "bg=$BG,fg=$FG"

tmux_set window-status-current-style "bg=$GRAY,fg=$FG"
tmux_set window-status-current-format "#[bg=$GRAY,fg=$BG]#[bg=$GRAY,fg=$FG] #I:#W #[bg=$BG,fg=$GRAY]"

# tmux_set window-style "fg=#4b5563,bg=#262626"
tmux_set window-style "fg=$FG,bg=$BG"

# pane
tmux_set display-panes-colour "$FG"
tmux_set display-panes-active-colour "$YELLOW"

# tmux_set pane-border-style "fg=$BG,bg=#262626"
tmux_set pane-border-style "fg=$GRAY"
tmux_set pane-active-border-style "fg=$FG,bg=$BG"

# message
tmux_set message-style "bg=$BG,fg=$YELLOW"

# selection
tmux_set mode-style "bg=$FG,fg=$BG"

# set-window-option -g clock-mode-colour colour109 #blue
