export PATH="$PATH:/usr/local/mysql/bin"
HISTFILESIZE=1000000000 HISTSIZE=1000000

export PATH=/opt/local/bin:/opt/local/sbin:$PATH:/opt/bin

#Colors!
export PS1='\[\e[0;36m\][\u@\h:\[\e[0;37m\]\W\[\e[0;36m\]]\[\e[1;31m\]\$ \[\e[0m\]'
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#rvm configuration
export PATH=~/.rvm/bin/:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

alias mvim="open -a /Applications/MacPorts/MacVim.app/ $1"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
