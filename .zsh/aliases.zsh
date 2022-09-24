# original shell-function
alias mcd='mkcdir'
alias cdd='fzf-cdr'
alias fpn='fzf-open'
alias fpd='fzf-open-dir'
alias fd='fd --exact-depth 1'

# list command
alias l='ls -vlG1'
alias la='ls -vlaG'

# some aliases
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
alias cls='cd /Users/eggngineer/FILEs/LABs/M1/Class/LastTerm'

# author-unique
alias egg='cd ~/files/devs/Git/github.com/Eggngineer'

# comfortable file making
alias tp='touch-python'
alias tc='touch-cpp'

# tmux utilities
alias fzf='fzf-tmux'
alias mkt='make_tmux_session'
alias tls='tmux ls'
alias sd='tmux detach'
alias main='tmux_main'
alias ide='tmux_ide'
alias ss='tmux_select_session'
alias ks='tmux_selectively_kill_session'

# github utilities
alias clone="gh-clone"
alias cln="gh-clone"
alias viewrepos="gh-brows-repos"
alias wr="gh-brows-repos"