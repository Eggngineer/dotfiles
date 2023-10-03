export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin

export PYENV_VIRTUAL_ENV_DISABLE_PROMPT=1

if hash "brew" > /dev/null 2>&1; then
	export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
fi

set $LANG to en_US.UTF-8
LANG='en_US.UTF-8'

if hash "cargo" > /dev/null 2>&1; then
  export PATH="$HOME/.cargo/bin:$PATH"
  . "$HOME/.cargo/env"
fi

if hash "starship" >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if hash "pyenv" >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

if [ "$LS_COLORS" -a -f /etc/DIR_COLORS ]; then
  eval $(dircolors /etc/DIR_COLORS)
fi

