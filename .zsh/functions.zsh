autoload -Uz is-at-least
if is-at-least 4.3.11
then
        autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
        add-zsh-hook chpwd chpwd_recent_dirs
        zstyle ':chpwd:*'            recent-dirs-max 500
        zstyle ':chpwd:*'            recent-dirs-default yes
        zstyle ':completion:*' recent-dirs-insert both
        zstyle ':chpwd:*' recent-dirs-pushd true
fi

### original shell functrions
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

function display_rooting(){
        arr=$(pwd | sed 's/\///' | sed 's/\//,/g')
        tmp=($(echo $arr | tr "," "\n"))
        max=$((${#tmp[@]}))
        str=""
        i=$(($1))
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
                if [[ $key == 'j' ]]; then
                        i=$(($i-1))
                elif [[ $key == 'l' ]]; then
                        i=$(($i+1))
                elif [[ $key == ' ' ]]; then
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

function rooting () {
        selection_rooting |
                while read line; do
                        dir=$line
                        printf '\r%*s\r' ${lenLine:-${#line}}
                        printf "%s" "$line"
                        lenLine=${#line}
                done
        cd $dir
        zle accept-line
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


function localhost(){
        url='http://localhost:'
        echo -n 'Port Number:'
        read port
        url=$url$port
        open $url
}

function mkcdir() {
        mkdir $1
        cd $1
}

function atcoder () {
        cd /Users/eggngineer/FILEs/DEVs/Git/github.com/Eggngineer/atcoder
        open "https://atcoder.jp/?lang=ja"
}

function open_here () {
        open ./
        zle accept-line
}

function open_here_by_VSCode() {
        code ./
        zle accept-line
}

### tmux is necessary
if hash "tmux" > /dev/null 2>&1; then
        function tmux_ide(){
                tmux split-window -v
                tmux resize-pane -U 10
                tmux select-pane -t 0
                tmux split-window -h
                # tmux split-window -h
                tmux select-pane -t 0
                # tmux resize-pane -L 80
                tmux clock
                tmux select-pane -t 1
                htop
                tmux select-pane -t 3
                tmux rename-session main
        }

        function tmux_vml(){
                tmux split-window -v
                tmux split-window -h
                tmux select-pane -t 0
                tmux split-window -h
                tmux rename-session vml
                tmux select-pane -t 0
        }

        function make_tmux_session(){
                echo -n "Session Name:"
                read sname
                tmux new-session -s $sname
        }
fi

### junegunn/fzf is necessary
if hash "fzf" > /dev/null 2>&1; then
        function sshsp() {
                local host=$(grep -E "^Host " ~/.ssh/config | sed -e 's/Host[ ]*//g' | fzf --height 40% --border)
                if [ -n "$host" ]; then
                        BUFFER="ssh $host"
                        zle accept-line
                fi
        }

        function fzf::get-ip-from-sshconfig() {
                local host=$(grep -E "^Host " ~/.ssh/config | sed -e 's/Host[ ]*//g' | fzf --height 40% --border)
                if [ -n "$host" ]; then
                        echo `ssh -G $host | grep -E '\bhostname' | sed 's/hostname //g'`
                fi

        }

        function fzf::select-git-switch() {
        target_br=$(
                git branch -a |
                fzf --layout=reverse --info=hidden --prompt="CHECKOUT BRANCH > " --preview="echo {} | tr -d ' *' | xargs git lg --color=always" |
                head -n 1 |
                perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g"
        )
        if [ -n "$target_br" ]; then
                BUFFER="git switch $target_br"
                zle accept-line
        fi
        }

        function fzf::select-git-switch() {
        target_br=$(
                git branch -a |
                fzf --layout=reverse --info=hidden --prompt="CHECKOUT BRANCH > " --preview="echo {} | tr -d ' *' | xargs git lg --color=always" |
                head -n 1 |
                perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g"
        )
        if [ -n "$target_br" ]; then
                BUFFER="git switch $target_br"
                zle accept-line
        fi
        }

        function fzf::cdr() {
                target_dir=` cdr -l | awk '{ print $2 }' | sed "s@\~@$HOME@" | sed "s@//^*@@g" | fzf --preview 'tree {} --noreport -C -L 1'`
                target_dir=`echo ${target_dir/\~/$HOME}`
                if [ -n "$target_dir" ]; then
                        cd "$target_dir"
                        zle accept-line
                fi
        }

        function fzf::open() {
                target_file=`fzf -p 60% --preview 'head -100 {}' --border`
                if [ -n "$target_file" ]; then
                        open $target_file
                fi
        }

        function fzf::open-dir() {
                target_dir=`fd | fzf --height 40% --preview 'tree {} --noreport -C    -L 1'`
                if [ -n "$target_dir" ]; then
                        open $target_dir
                fi
        }

        function gh-clone() {
                echo -n 'User Name?:'
                read USER_NAME
                if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
                        echo \
        'use: "command <option>"
        options:
                -h, --help : shows help'
                else
                        REPOSITORY=$(gh repo list $USER_NAME --json nameWithOwner -q '.[].nameWithOwner' | fzf)
                        if [ $REPOSITORY ]; then
                                gh repo clone $REPOSITORY
                        fi
                fi
        }

        function gh-brows-repos() {
                echo -n 'User Name?:'
                read USER_NAME
                if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
                        echo \
        'use: "command <option>"
        options:
                -h, --help : shows help'
                else
                        REPOSITORY=$(gh repo list $USER_NAME --json nameWithOwner -q '.[].nameWithOwner' | fzf)
                        if [ $REPOSITORY ]; then
                                gh repo view --web $REPOSITORY
                        fi
                fi
        }

        function fzf::spotlight() {
                local OUTPUT=$(ls -1 -d /Applications/* /System/Applications/* /System/Applications/Utilities/* | sed 's/.app\//.app/g' | grep .app)
                local APP=$(echo $OUTPUT | grep -v "/$" | sed 's/.*\///g' | sed 's/.app//g' | fzf)
                if [ ! "$APP" = "" ]; then
                        APP="$APP.app"
                        open "$(echo $OUTPUT | grep '/'$APP)"
                fi
                zle accept-line
        }

        if hash "tmux" > /dev/null 2>&1; then
                function tmux_select_session(){
                        sname=`tmux ls | fzf --reverse | sed 's/:.*//g'`
                        if [[ $sname ]]; then
                                tmux a -d -t $sname
                        fi
                }

                function tmux_selectively_kill_session(){
                        sname=`tmux ls | fzf --reverse | sed 's/:.*//g'`
                        if [[ $sname ]]; then
                                tmux kill-session -t $sname
                        fi
                }
                if hash "nvim" > /dev/null 2>&1; then
                        function fzf::open_with_nvim(){
                              target_dir=` cdr -l | awk '{ print $2 }' | sed "s@\~@$HOME@" | sed "s@//^*@@g" | fzf --preview 'tree {} --noreport -C -L 1'`
                              target_dir=`echo ${target_dir/\~/$HOME}`
                              if [ -n "$target_dir" ]; then
                                      tmux popup -w80% -h80% -d "$(pwd)" -E "nvim $target_dir"
                                      zle accept-line
                              fi

                        }
                fi
        fi

        if hash "ghq" > /dev/null 2>&1; then
                function fzf::ghq-src () {
                local selected_dir=$(ghq list -p | fzf)
                if [ -n "$selected_dir" ]; then
                        BUFFER="cd ${selected_dir}"
                        zle accept-line
                fi
                zle clear-screen
                }
        fi
fi

source $HOME/.zsh/zle.zsh
