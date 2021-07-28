# .bashrc

# User specific aliases and functions

alias rm='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias v='vim'
alias e='exit'
alias l='ls -al'
alias lh='ls -alh'

alias python='python3.6'
alias pip='pip3'
alias py='python3.6'

#git_alias
alias g='git'
alias ga='git add'
alias gc='git clone'

#docker_alias
alias d='docker'

alias fwc='firewall-cmd'
alias ipt='iptables'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
