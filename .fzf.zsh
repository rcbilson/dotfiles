# Setup fzf
# ---------
if [[ ! "$PATH" == */home/richard/dotfiles/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/richard/dotfiles/fzf/bin"
fi

source <(fzf --zsh)
