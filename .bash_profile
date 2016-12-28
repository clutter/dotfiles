#
# environment variables
#
## pyenv
## required: pyenv
if which pyenv > /dev/null; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

## load .bashrc
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
