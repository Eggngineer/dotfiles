if hash "go" > /dev/null 2>&1; then
    export GOPATH=$HOME/Go
    export GOBIN=/Users/eggngineer/Go/bin/
    export PATH=$PATH:$GOPATH/bin
fi

export PATH="$PATH:/opt/homebrew/bin"

# pyenv でバグった時に使ったけど要らなそう
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

export FZF_TMUX_OPTS="-p 80%"
export PATH="$PATH:/opt/R/arm64/bin"

export PATH="$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources"

export PATH="/usr/local/bin:$PATH"