unbind C-b
set -g prefix C-a
bind r source-file ~/.tmux.conf \; display-message "Config reloaded."



#set -g default-terminal tmux-256color
#set -g default-terminal screen-256color
set -g default-terminal xterm-256color
set -g base-index 1
set -g default-command "${SHELL}"
set-option -g status-position top

# Sync panes
bind -n C-x setw synchronize-panes

# Mouse
set -g  mouse on
set -ag terminal-overrides ",st-*:Tc"
set -g history-limit 30000
# Scrolling in copy-mode
bind-key -T root WheelUpPane   if-shell -F -t = "#{alternate_on}" "send-keys -M" "select-pane -t =; copy-mode -e; send-keys -M"
bind-key -T root WheelDownPane if-shell -F -t = "#{alternate_on}" "send-keys -M" "select-pane -t =; send-keys -M"
# Fast scroll with Ctrl
bind-key -T root C-WheelUpPane if-shell -F -t = "#{alternate_on}" "send-keys -M" "select-pane -t =; copy-mode -e; send-keys -M"

# Toggle mouse on/off
bind-key m set-option -g mouse on \; display 'Mouse: ON'
bind-key M set-option -g mouse off \; display 'Mouse: OFF'

# Display
set -g display-time 5000
set -g status-bg default
set -g status-fg black

set -g pane-border-fg default
set -g pane-border-bg default

set -g pane-active-border-fg colour38
set -g pane-active-border-bg default

set -g monitor-activity on
set -g visual-activity on

set -g status-fg white
set -g status-bg default
set -g status-attr default

set -g window-status-fg colour166
set -g window-status-bg default
set -g window-status-attr dim

set -g window-status-current-fg colour38
set -g window-status-current-bg default

set -g set-titles on
set -g status on
set -g status-interval 2
set -g status-justify centre
set -g automatic-rename on

#source-file "${HOME}/.tmux-themepack/powerline/block/magenta.tmuxtheme"

set -g message-bg default
set -g message-fg yellow


# --------
setw -g mode-keys vi

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'jimeh/tmux-themepack'
set -g @themepack 'powerline/block/yellow'

run '~/.tmux/plugins/tpm/tpm'

# Left side
set -g status-left "#(~/.tmux/left)"

# Right side
set -g status-right '#(~/.tmux/right)'

# Clipboard
#set-option -g default-command "which reattach-to-user-namespace > /dev/null && reattach-to-user-namespace -l $SHELL || $SHELL"

bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe "pbcopy"
