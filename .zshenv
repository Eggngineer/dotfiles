export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin

if hash "cargo" > /dev/null 2>&1; then
  export PATH="$HOME/.cargo/bin:$PATH"
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
. "$HOME/.cargo/env"
