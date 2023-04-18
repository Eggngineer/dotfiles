# fzf-base functions
if hash "fzf" >/dev/null 2>&1; then
    alias cdd='fzf::cdr'
    alias fpn='fzf::open'
    alias fpd='fzf::open-dir'
    alias his='history -E -i 1 | fzf'
    if hash "pyenv" >/dev/null 2>&1; then
        alias pl='pyenv local $(pyenv versions | fzf)'
    fi
fi

# fd option
if hash "fd" >/dev/null 2>&1; then
    alias fd='fd --exact-depth 1'
fi

# devbox command
if hash "devbox" > /dev/null 2>&1; then
    alias db='devbox'
fi

# list command
if hash "lsd" >/dev/null 2>&1; then
    alias l="lsd -l"
    alias la="lsd -la"
else
    alias l='ls -vlG1'
    alias la='ls -vlaG'
fi

# tmux utilities
if hash "tmux" >/dev/null 2>&1; then
    alias fzf='fzf-tmux -p 80%'
    alias mkt='make_tmux_session'
    alias tls='tmux ls'
    alias sd='tmux detach'
    alias ide='tmux_ide'
    alias vml='tmux_vml'
    alias ts='tmux_select_session'
    alias ks='tmux_selectively_kill_session'
fi

# github utilities
if hash "gh" >/dev/null 2>&1; then
    alias cln="gh-clone"
    alias viewrepos="gh-brows-repos"
    alias wr="gh-brows-repos"
fi

# visual studio code utilities
if hash "code" >/dev/null 2>&1; then
    alias v='code'
    alias v.='code ./'
fi

# Macintosh utils
if [ $(uname -s) = "Darwin" ]; then
    alias psp='pmset sleepnow'
fi
# some aliases
alias mcd='mkcdir'
alias grep='grep --color=auto'
alias ..='cd ../'
alias ...='cd ../../'
alias o='open'
alias o.='open ./'
alias to='tree -L 1'
alias tt='tree -L 2'
alias pwd='pwd -P'
alias zrc='source $HOME/.zshrc'

# author-unique
alias egg='cd ~/files/devs/Git/github.com/Eggngineer'
alias cls='cd /Users/eggngineer/FILEs/LABs/M1/Class/LastTerm'
alias ssp="sshsp"
alias tp='touch-python'
alias tc='touch-cpp'
alias gen='nkf --guess'