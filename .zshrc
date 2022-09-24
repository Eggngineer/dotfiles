source $HOME/.zshenv
source $HOME/.zsh/path_export.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/completions.zsh
source $HOME/.zsh/setopt.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/keybind.zsh
source $HOME/.zsh/autoload.zsh
source $HOME/.zsh/zle.zsh
source $HOME/.zsh/history.zsh

source $ZPLUG_HOME/init.zsh

cache_dir=$HOME/.zlpug/cache

if [ -d $cache_dir ]; then
  plugins=$HOME/.zsh/zplug_plugin.zsh
  cache=$cache_dir/interface
  plugin_date=$(date -r $plugins +%s)
  cache_date=$(date -r $cache +%s)

  if [ ! -d $cache_dir -o $plugin_date -gt $cache_date ]; then
    source $HOME/.zsh/zplug_plugin.zsh
  fi
else
  source $HOME/.zsh/zplug_plugin.zsh
fi

my-compact-chpwd-recent-dirs
cd $HOME

