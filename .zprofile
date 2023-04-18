# homebrew
if hash "brew" > /dev/null 2>&1; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pyenv
if hash "pyenv" > /dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv/shims"
    export PATH="$PATH:$PYENV_ROOT"
    export PIPENV_PYTHON="$PYENV_ROOT/python"
fi

#poetry
export PATH="/Users/eggngineer/.local/bin:$PATH"