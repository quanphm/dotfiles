#!/usr/bin/env bash

# colours
BG="#181616"
FG="#c5c9c5"
GREEN="#8a9a7b"
YELLOW="#c4b28a"
BLUE="#8ba4b0"
TEAL="#8ea4a2"

tmux_set() {
  tmux set-option -gq "$1" "$2"
}

tmux_set status on
tmux_set status-style "bg=$BG,fg=$FG"
tmux_set status-interval 2

# Left side of status bar
tmux_set status-left-style "none"
tmux_set status-left-length 80
tmux_set status-left "#[fg=$BG,bg=$GREEN] #S #[fg=$GREEN,bg=$BG]"

# Right side of status bar
tmux_set status-right-style "none"
tmux_set status-right-length 140
tmux_set status-right "#[fg=$TEAL,bg=$BG,nobold,noitalics,nounderscore]#[fg=$BG,bg=$TEAL] #($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -i 2 -a 0) #[fg=$BG,bg=$BLUE]#[fg=$BLUE,bg=$BG,nobold,noitalics,nounderscore]#[fg=$BG,bg=$BLUE] %a %d %b  %H:%M "

# window
tmux_set status-justify left
tmux_set window-status-separator ""

tmux_set window-status-format " #I:#W "
tmux_set window-status-style "bg=$BG,fg=$FG"

tmux_set window-status-current-style "bg=$YELLOW,fg=$BG"
tmux_set window-status-current-format "#[bg=$YELLOW,fg=$BG]#[bg=$YELLOW,fg=$BG] #I:#W #[bg=$BG,fg=$YELLOW]"

tmux_set window-style "fg=#4b5563,bg=#262626"
tmux_set window-active-style "fg=$FG,bg=$BG"

# pane
tmux_set display-panes-colour "$FG"
tmux_set display-panes-active-colour "$GREEN"

tmux_set pane-border-style "fg=$BG"
tmux_set pane-active-border-style "fg=$FG"

# message
tmux_set message-style "bg=#1F1F28,fg=$YELLOW"

# set-window-option -g clock-mode-colour colour109 #blue
