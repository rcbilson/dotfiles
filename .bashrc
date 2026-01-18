if test -n "$EDITOR"
then
        alias vi=$EDITOR
fi        
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"

eval "$(zoxide init bash)"

[ -f ~/dotfiles/.fzf.bash ] && source ~/dotfiles/.fzf.bash
