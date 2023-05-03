#!/usr/bin/env bash

# colours
BG="#181616"
FG="#c5c9c5"
RED="#c4746e"
GREEN="#8a9a7b"
YELLOW="#c4b28a"
BLUE="#8ba4b0"

tmux_set() {
  tmux set-option -gq "$1" "$2"
}

tmux_set status on
tmux_set status-style "bg=$BG,fg=$FG"

# Left side of status bar
tmux_set status-left-style "none"
tmux_set status-left-length 80
tmux_set status-left "#[fg=$BG,bg=$GREEN] #S #[fg=$GREEN,bg=$BG]"

# Right side of status bar
tmux_set status-right-style "none"
tmux_set status-right-length 80
tmux_set status-right "#[fg=$BLUE,bg=$BG,nobold,noitalics,nounderscore]#[fg=$BG,bg=$BLUE] %a %d %b  %H:%M "

# window
tmux_set status-justify left
tmux_set window-status-separator ""

tmux_set window-status-format " #I:#W "
tmux_set window-status-style "bg=$BG,fg=$FG"

tmux_set window-status-current-style "bg=$YELLOW,fg=$BG"
tmux_set window-status-current-format "#[bg=$YELLOW,fg=$BG]#[bg=$YELLOW,fg=$BG] #I:#W #[bg=$BG,fg=$YELLOW]"

# pane
tmux_set display-panes-colour "$FG"
tmux_set display-panes-active-colour "$GREEN"

tmux_set pane-border-style "fg=$BG"
tmux_set pane-active-border-style "fg=$FG"

# message
tmux_set message-style "bg=#1F1F28,fg=$YELLOW"

# set-window-option -g clock-mode-colour colour109 #blue
