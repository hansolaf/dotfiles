#git aliases
alias gs='git status'
alias ga='git add -A .'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git lg'
alias grc='git rebase --continue'
alias gm='git commit -m'
alias gu='git pull'
alias gur='git pull --rebase'
alias gp='git push'

#other aliases
alias e='emacs -nw'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

#caps->ctrl
xmodmap ~/dotfiles/.xmodmap

#shell config
HISTSIZE=1000000
HISTFILESIZE=1000000
source ~/dotfiles/git-prompt.sh
export PS1='\[\e[1;32m\]\w\[\e[1;31m\]$(__git_ps1 " (%s)") \[\e[1;34m\]$\[\e[0m\] '
