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
