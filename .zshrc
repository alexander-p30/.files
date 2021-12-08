# vim:foldmethod=marker

# oh-my-zsh {{{
export ZSH="/home/alexander/.oh-my-zsh"

# Theme

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
