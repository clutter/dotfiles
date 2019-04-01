## command
alias ls='ls -G'
alias g='git'
alias be='bundle exec'
alias emacs='emacs -nw'

## history with timestamp
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

## private setting
if [ -f ~/.bash_private ] ; then
    . ~/.bash_private
fi
