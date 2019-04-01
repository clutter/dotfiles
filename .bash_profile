#
# environment variables
#
## pyenv
## required: pyenv
if which pyenv > /dev/null; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

## load .bashrc
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## golang
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

## rust
if [ -d ~/.cargo ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

## rbenv PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

## android
if [ -d ~/Library/Android/sdk ] ; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH=$PATH:$ANDROID_HOME/platform-tools
fi
