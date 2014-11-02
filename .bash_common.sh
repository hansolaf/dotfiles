unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
else
   platform='linux'
fi

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
if [[ $platform == 'osx' ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -lah'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

#caps->ctrl
if [[ $platform == 'linux' ]]; then
    xmodmap ~/dotfiles/.xmodmap
fi

#shell config
HISTSIZE=1000000
HISTFILESIZE=1000000

#prompt
source ~/dotfiles/git-prompt.sh
if [ -z "$PS1CHAR" ]; then
    PS1CHAR=☭
fi
export PS1='\[\e[0;32m\]\w\[\e[0;33m\]$(__git_ps1 " (%s)") \[\e[0;35m\]$PS1CHAR\[\e[0m\] '

