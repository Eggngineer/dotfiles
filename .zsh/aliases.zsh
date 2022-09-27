# fzf-base functions
if hash "fzf" >/dev/null 2>&1; then
    alias cdd='fzf::cdr'
    alias fpn='fzf::open'
    alias fpd='fzf::open-dir'
fi

# fd option
if hash "fd" >/dev/null 2>&1; then
    alias fd='fd --exact-depth 1'
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
    alias fzf='fzf-tmux -p 60%'
    alias mkt='make_tmux_session'
    alias tls='tmux ls'
    alias sd='tmux detach'
    alias main='tmux_main'
    alias ide='tmux_ide'
    alias ss='tmux_select_session'
    alias ks='tmux_selectively_kill_session'
fi 

# github utilities
if hash "gh" >/dev/null 2>&1; then
    alias cln="gh-clone"
    alias viewrepos="gh-brows-repos"
    alias wr="gh-brows-repos"
fi

# some aliases
alias mcd='mkcdir'
alias grep='grep --color=auto'
alias ..='cd ../'
alias ...='cd ../../'
alias his='history -E -i 1 | fzf'
alias v='code'
alias v.='code ./'
alias o='open'
alias o.='open ./'
alias psp='pmset sleepnow'
alias tt='tree -L 2'
alias pwd='pwd -P'

# author-unique
alias egg='cd ~/files/devs/Git/github.com/Eggngineer'
alias cls='cd /Users/eggngineer/FILEs/LABs/M1/Class/LastTerm'
alias ssp="sshsp"

# comfortable file making
alias tp='touch-python'
alias tc='touch-cpp'