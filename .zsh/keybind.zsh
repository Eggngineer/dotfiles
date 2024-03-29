bindkey -d
# ^g show git branch
bindkey "^g" fzf::select-git-switch
# ^p complete backward candidates
bindkey "^p" history-beginning-search-backward-end
# ^n undo completions until where you wrote
bindkey "^n" history-beginning-search-forward-end
# ^j "rooting: original command (dist:<github>/Eggngineer/rooting or func.zsh)"
bindkey "^j" rooting
# ^f "cdd: original command (func.zsh)"
bindkey "^f" fzf::cdr
# ^] list&jamp the directories under control by "gh/ghq"
bindkey '^]' fzf::ghq-src
# ^k fuzzy-search apps and run it like Spotlight-Search (only applications: /Applications/*)
bindkey '^k' fzf::spotlight
# ignore real Spotlight search in systemPreference and remap CMD+space -> ^[k in terminal apps.
bindkey '^[k' fzf::spotlight
# cmd+s --> sshsp: ssh-ing with fzf amoung ~/.ssh/config
bindkey '^[s' sshsp
# cmd+o --> openhere: open ./
bindkey '^[o' open_here
# ctr+v --> openhere: code ./
bindkey '^v' open_here_by_VSCode
# ctrl+e --> fzf::open_with_nvim
bindkey '^e' fzf::open_with_nvim
# ctrl+b --> fzf::bluetoothctl
bindkey '^b' fzf::bluetoothctl
