if test -n "$EDITOR"
then
        alias vi=$EDITOR
fi        
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"
