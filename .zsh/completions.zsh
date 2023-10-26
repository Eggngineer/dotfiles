# press tab to complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu true select
zstyle ':completion:*:rm:*' menu false
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' file-list all
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list
zstyle ':completion:*:messages' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red} No matches for:%f %F{yellow}%d%f'
zstyle ':completion:*:descriptions' format '%F{yellow}completing%f %B%d%b'
zstyle ':completion:*:corrections' format '%B%F{yellow}%d%f %F(errors: %e)%b'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true