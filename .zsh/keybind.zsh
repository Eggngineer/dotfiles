# ^g show git branch
bindkey "^g" select-git-switch 
# ^p complete backward candidates
bindkey "^p" history-beginning-search-backward-end
# ^n undo completions until where you wrote
bindkey "^n" history-beginning-search-forward-end
# ^j "rooting: original command (dist:<github>/Eggngineer/rooting or func.zsh)"
bindkey "^j" zle-rooting
# ^f "cdd: original command (func.zsh)"
bindkey "^f" zle-cdd
# ^] list&jamp the directories under control by "gh/ghq"
bindkey '^]' peco-src