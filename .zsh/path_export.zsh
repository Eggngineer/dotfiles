export ZPLUG_HOME=$(brew --prefix)/opt/zplug
export GOPATH=$HOME/Go
export PATH=$PATH:$GOPATH/bin
export PATH="/opt/homebrew/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export FZF_TMUX_OPTS="-p 80%"
export PATH=/opt/R/arm64/bin:$PATH