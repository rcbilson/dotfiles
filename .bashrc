if test -n "$EDITOR"
then
        alias vi=$EDITOR
fi        
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"

# Set up fzf key bindings and fuzzy completion
source /usr/share/bash-completion/completions/fzf

eval "$(zoxide init bash)"

[ -f ~/dotfiles/.fzf.bash ] && source ~/dotfiles/.fzf.bash
