# vim:foldmethod=marker

# p10k instant prompt {{{
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# }}}

# oh-my-zsh {{{
# Path to your oh-my-zsh installation.
export ZSH="/home/alexander/.oh-my-zsh"

# Theme
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	asdf
  docker-compose
	git
	zsh-syntax-highlighting
	zsh-autosuggestions	
)

source $ZSH/oh-my-zsh.sh
# }}}

# User configuration {{{
# File sourcing {{{
source ~/.extended/.git-aliases 
source ~/.extended/.rails-aliases 
source ~/.extended/.soft-aliases 
source ~/.extended/.system-aliases 
source ~/.extended/.system-envs 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# p10k {{{
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# autoload -Uz compinit
# }}}

# Kitty {{{
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
# }}}

# Prompt {{{
eval "$(starship init zsh)"
# }}}
# }}}

[ -f "/home/alexander/.ghcup/env" ] && source "/home/alexander/.ghcup/env" # ghcup-env
TEMP_RUN=$RUN
export RUN=
eval "$TEMP_RUN" # run arbitrary commands ```RUN='echo "it works"' zsh```
