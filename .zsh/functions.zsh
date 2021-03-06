if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*'      recent-dirs-max 500
  zstyle ':chpwd:*'      recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-pushd true
fi

function corr(){
    arr=$(pwd | sed 's/\///' | sed 's/\//,/g')
    tmp=($(echo $arr | tr "," "\n"))
    str=""
    i=$1
    for dir in ${tmp[@]}; 
        do
            str+="/"
            str+=$dir
            if [[ ${tmp[$(($i))]} == $dir ]]; then
                break
            fi
        done
    echo $str
}

function err1(){
    echo "select direcory is out of bound."
    exit
}

function display_rooting(){
    arr=$(pwd | sed 's/\///' | sed 's/\//,/g')
    tmp=($(echo $arr | tr "," "\n"))
    max=$((${#tmp[@]}))
    str=""
    i=$(($1))
    # echo $max
    if [ $i -le $max ]; then 
        for dir in ${tmp[@]}; 
            do
                if [[ ${tmp[$(($i))]} == $dir ]]; then
                    ESC=$(printf '\033') 
                    dir="${ESC}[32m${dir}${ESC}[m"
                fi
                str+="/"
                str+=$dir
            done
    fi
    echo $str
}

function selection_rooting(){
    arr=$(pwd | sed 's/\///' | sed 's/\//,/g')
    tmp=($(echo $arr | tr "," "\n"))
    max=$((${#tmp[@]}))
    i=$(($max))
    display_rooting $i
    while :; do
        read -ks key
        if [[ $key == 'f' ]]; then
            i=$(($i-1))
        elif [[ $key == 'j' ]]; then
            i=$(($i+1))
        else
            break
        fi 
        if [[ $i -lt 1 ]]; then
            i=$((1))
        fi
        if [[ $i -gt $max ]]; then
            i=$(($max))
        fi
        display_rooting $i
    done
    corr $i
}

alias rr='rooting'
function rooting () {
    selection_rooting |
        while read line; do
            dir=$line
            printf '\r%*s\r' ${lenLine:-${#line}}
            printf "%s" "$line"
            lenLine=${#line}
        done
    cd $dir
}

function zle-rooting () {
    rooting
    zle accept-line
}

function touch-python () {
    file="$1.py"
    touch $file
    echo "" > $file
    echo "import sys" >> $file
    echo "input = sys.stdin.readline" >> $file
    echo "sys.setrecursionlimit(10**9)" >>$file
}

function touch-cpp () {
    file="$1.cpp"
    touch $file
    echo -n "" > $file
    echo "#include<bits/stdc++.h>" >> $file
    echo "using namespace std;" >> $file
    echo "" >> $file
    echo "int main(){" >> $file
    echo "" >> $file
    echo "}" >> $file

}

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

alias ssp="sshsp"
function sshsp() {
  local host=$(grep -E "^Host " ~/.ssh/config | sed -e 's/Host[ ]*//g' | fzf-tmux -p 40% --height 40%  --border)
  if [ -n "$host" ]; then
    ssh $host
  fi
}


function select-git-switch() {
  target_br=$(
    git branch -a |
      fzf-tmux -p 80% --layout=reverse --info=hidden --prompt="CHECKOUT BRANCH > " --preview="echo {} | tr -d ' *' | xargs git lg --color=always" |
      head -n 1 |
      perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g"
  )
  if [ -n "$target_br" ]; then
    BUFFER="git switch $target_br"
    zle accept-line
  fi
}


# mkcdir
function mkcdir() {
    mkdir $1
    cd $1
}

# fzf-cdr
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//'  | sed "s@~@$HOME@" |   fzf-tmux -p 80% --preview 'tree {} --noreport -C  -L 1'`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}

function zle-cdd () {
    fzf-cdr
    zle accept-line
}

# fzf-open
function fzf-open() {
    target_file=`fzf --height 40% --preview 'head -100 {}' --border`
    if [ -n "$target_file" ]; then
        open $target_file
    fi
}

# fzf-open-dir
function fzf-open-dir() {
    target_dir=`expand-dirs | fzf --height 40% --preview 'head -100 {}' --border`
    if [ -n "$target_dir" ]; then
        open $target_dir
    fi
}

# fzf-change-dir
function fzf-change-dir() {
    target_dir=`expand-dirs | fzf --height 40% --preview 'head -100 {}' --border`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}

function expand-dirs() {
  myDIRs=$(echo $(ls -d */) | sed 's/\///g')
  ary=(`echo $myDIRs`)
  for i in `seq 1 ${#ary[@]}`
  do
    echo ${ary[$i]}
  done
}

function tmux_main(){
    tmux split-window -v
    tmux split-window -h
    tmux resize-pane -D 15
    tmux select-pane -t 1
}
function tmux_ide(){
    tmux split-window -v
    tmux resize-pane -U 10
    tmux select-pane -t 0
    tmux split-window -h
    tmux split-window -h
    tmux select-pane -t 0
    tmux resize-pane -L 80
    tmux clock
    tmux select-pane -t 3
}
function make_tmux_session(){
    echo -n "Session Name:"
    read sname 
    tmux new-session -s $sname
}
function tmux_select_session(){
    sname=`tmux ls | fzf --height 20% --reverse | sed 's/:.*//g'`
    tmux a -t $sname
}
function tmux_selectively_kill_session(){
    sname=`tmux ls | fzf --height 20% --reverse | sed 's/:.*//g'`
    tmux kill-session -t $sname
}
#cite: https://blog.n-z.jp/blog/2014-07-25-compact-chpwd-recent-dirs.html 
function my-compact-chpwd-recent-dirs () {
    emulate -L zsh
    setopt extendedglob
    local -aU reply
    integer history_size
    autoload -Uz chpwd_recent_filehandler
    chpwd_recent_filehandler
    history_size=$#reply
    reply=(${^reply}(N))
    (( $history_size == $#reply )) || chpwd_recent_filehandler $reply
}