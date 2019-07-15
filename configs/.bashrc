# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vim="nvim"
alias startx='ssh-agent startx'
alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

export BASH_IT="/home/ba1ash/.bash-it"
export BASH_IT_THEME='bobby'
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
export SCM_CHECK=true
export SHORT_HOSTNAME=$(hostname -s)
export SHORT_TERM_LINE=true
export EDITOR=nvim
export PATH="$PATH:/home/ba1ash/.local/bin"
export PATH="$PATH:/opt"
export PATH="$HOME/.rbenv/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export YELLOW=`echo -e '\033[1;33m'`
export LIGHT_CYAN=`echo -e '\033[1;36m'`
export GREEN=`echo -e '\033[0;32m'`
export NOCOLOR=`echo -e '\033[0m'`
export LESS="--raw-control-chars -iMSx4 -FXR"
export PAGER="sed \"s/^\(([0-9]\+ [rows]\+)\)/$GREEN\1$NOCOLOR/;s/^\(-\[\ RECORD\ [0-9]\+\ \][-+]\+\)/$GREEN\1$NOCOLOR/;s/|/$GREEN|$NOCOLOR/g;s/^\([-+]\+\)/$GREEN\1$NOCOLOR/\" 2>/dev/null | less"

# history configuration
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

source "$BASH_IT"/bash_it.sh
source "$HOME/opt/alacritty/alacritty-completions.bash"
source ~/.fzf.bash
source /usr/share/git/completion/git-completion.bash

set -o vi
unset MAILCHECK

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
