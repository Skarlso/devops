# DevOps
Various scripts and settings I use for building software. 

Also, vim.

Install https://github.com/sindresorhus/pure.

Note, this has to go in ZSHRC:

```bash
# ZSH_THEME=""
...
...
# Loading plugins
source $ZSH/oh-my-zsh.sh
# User configuration
autoload -U promptinit; promptinit
autoload -Uz compinit && compinit
prompt pure
```
Note, plugins are loaded first, than oh-my-zsh.sh and than the rest. This is because fpath is set later on. So stuff that I'm
putting into oh-my-zsh/functions is not loaded otherwise. The two files, async and prompt.

Tmux Docker marrige:

```bash
tmux new -d -s minecraft 'docker exec -it mc_server3 java -jar minecraft_server.jar nogui'
```

Using tmuxp to manage tmux sessions and auto start them with the right commands already running:

https://tmuxp.git-pull.com/en/latest/examples.html

```yaml
start_directory: "~/code/"
session_name: devel
windows:
  - window_name: Kube
    layout: main-vertical 
    focus: true
    automatic-rename: 'off'
    shell_command_before:
      - wd kube
    panes:
      - clear
      - clear
      - shell_command:
        - echo "hi"

  - window_name: go-furnace
    layout: main-vertical 
    automatic-rename: 'off'
    shell_command_before:
      - wd furnace
    panes:
      - clear
      - clear
```
