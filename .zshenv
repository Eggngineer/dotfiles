export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin

export PYENV_VIRTUAL_ENV_DISABLE_PROMPT=1

if [ $(uname -s) = "Linux" ]; then
	export PATH="/usr/bin:$PATH"
	export DOCKER_HOST=unix:///run/user/`id -u`/docker.sock
fi

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
