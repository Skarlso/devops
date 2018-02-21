#!/bin/bash
#tmux new-session -d -n 'irc' 'ncdu'
tmux new-session -d -n 'irc' 'mpg123 /mnt/INT2/strek/start.mp3 && weechat-curses'
tmux rename-session Tmux
tmux split-window -h   'newsbeuter'
tmux selectp -t 1
tmux split-window -v   'ocp-curses'
tmux selectp -t 2
tmux split-window -v  'texnut '
tmux selectp -t 0
tmux split-window -v -p 25 '~/scripts/rainbow.sh'
#tmux split-window -v -p 25 't stream timeline -C icon'
tmux selectp -t 2
tmux split-window -v -p 25 '~/stag3.sh'
tmux split-window -h   'cava'
tmux new-window -n 'Media' '~/venv/bin/mpsyt'
tmux split-window -h  -p 40  'journalctl -f'
tmux selectp -t 0
tmux split-window -h  -p 50  'mpg123 /mnt/INT2/strek/phasers.mp3 && radio'
tmux selectp -t 1
tmux split-window -v  -p 60 'livestreamer-curses' 
tmux selectp -t 2
tmux split-window -v  '~/scripts/torrentflix/bin/torrentflix'
tmux selectp -t 0
tmux split-window -v -p 35   'mp3 .pink floyd'
tmux selectp -t 5
tmux split-window -v  -p 60 '~/scripts/subscow.sh' 
tmux new-window -n 'vim' 'slrn'
tmux split-window -h  -p 40  
tmux selectp -t 0
tmux split-window -v  -p 50 'vim /home/cirrus/scripts/cli.txt.pl'
tmux selectp -t 2 
tmux split-window -v  -p 35  'mutt'
tmux selectw -t 1
tmux -2 attach-session -t Tmux
