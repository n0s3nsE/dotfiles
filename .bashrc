# .bashrc

# User specific aliases and functions

alias rm='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias v='vim'
alias e='exit'
alias l='ls -al'
alias lh='ls -alh'

alias py='python3.8'

#git_alias
alias g='git'
alias ga='git add'
alias gp='git push'
alias gc='git commit'

#docker_alias
alias d='docker'
alias dc='docker-compose'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
