# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.zshenv
source $HOME/.zsh/path_export.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/completions.zsh
source $HOME/.zsh/setopt.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/keybind.zsh
source $HOME/.zsh/autoload.zsh
source $HOME/.zsh/zle.zsh


# Then, source plugins and add commands to $PATH
# zplug load --verbose
source $ZPLUG_HOME/init.zsh

cache_dir=$HOME/.zplug/cache

if [ -d $cache_dir ]; then
  plugins=$HOME/.zsh.d/zplug_plugin.zsh
  cache=$cache_dir/interface
  plugin_date=$(date -r $plugins +%s)
  cache_date=$(date -r $cache +%s)
  if [ ! -d $cache_dir -o $plugin_date -gt $cache_date ]; then
    . $HOME/.zsh.d/zplug_plugin.zsh
  fi
else
  . $HOME/.zsh.d/zplug_plugin.zsh
fi

zplug load


POWERLEVEL9K_MODE="nerdfont-complete"

# done @ every "source"
# remove invalid directory paths from history (cache)
my-compact-chpwd-recent-dirs
cd $HOME
clear
