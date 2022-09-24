# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv/shims"
export PATH="$PATH:$PYENV_ROOT"
export PIPENV_PYTHON="$PYENV_ROOT/python"