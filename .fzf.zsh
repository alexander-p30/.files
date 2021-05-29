# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alexander/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/alexander/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alexander/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alexander/.fzf/shell/key-bindings.zsh"
