# original shell-function
alias mcd='mkcdir'
alias cdd='fzf-cdr'
alias fpn='fzf-open'
alias fpd='fzf-open-dir'
alias fd='fzf-change-dir'

# list command
alias l='ls -vlG'
alias la='ls -vlaG'
alias ll='ls -vlG'
alias ls='ls -vG'

# some aliases
alias grep='grep --color=auto'
alias ..='cd ../'
alias ...='cd ../../'
alias his='history -E -i 1 | fzf'
alias v='code'
alias v.='code ./'
alias o='open'
alias o.='open ./' 
alias psp='powsleep'
alias tt='tree -L 2'
alias pwd='pwd -P'

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
