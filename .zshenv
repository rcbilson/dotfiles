export PATH=~/bin:~/.local/bin:~/dotfiles/bin:~/go/bin:~/.npm-global/bin:/usr/local/go/bin:$PATH
export EDITOR=`which vim`
export VISUAL=$EDITOR

alias vi="$EDITOR"
alias k='kubectl'
 
kuc() {
    case "x$1" in
    x) context=docker-desktop ;;
    *) context="$1.knilson.org" ;;
    esac
    kubectl config use-context $context
}

venv() {
    vi ~/.zshenv
    . ~/.zshenv
}

fin() {
    files=$(find . -name "$*")
    test -n "$files" && vim ${=files}
}

tools() {
    if test -d tools
    then
        export PATH=$(pwd)/tools:$PATH
    else
        echo "no tools directory in $(pwd)"
    fi
}

goroutines() {
  k exec $1 -- wget -O - 'http://localhost:6060/debug/pprof/goroutine?debug=2'
}

vit() {
  awk '{print $1}' tags|fzf --bind "enter:become(vim -t {})"
}

vil() {
  locate "$@" |fzf --bind "enter:become(vim {})"
}

vif() {
  fzf --walker=file --bind "enter:become(vim {})"
}

vig() {
  vi $(ag  "$@" | fzf | awk -F: '{ print $1, "+" $2 }')
}

vimparams() {
  echo "$*" | awk -F: '{ if (NF >= 2 && match($2, "[0-9]+")) { print $1 " +" $2 } else { print $1 } }'
}

v() {
  $* | fzf --bind 'enter:become:vim $(vimparams {})'
}

tn() {
  tmux new -s $(basename $PWD)
}

fix_alacritty() {
  xattr -dr com.apple.quarantine "/Applications/Alacritty.app"
}

pull_dotfiles() {
  cd ~/dotfiles
  git pull --ff-only
  tmux source .tmux.conf
  cd -
}

precommit() {
  git status --porcelain | awk '/\.go$/{print $2}' | xargs goreturns -w
}

dlv_test() {
  dlv test -- -test.run "$@"
}

tkill() {
  ps aux | grep 'tmux attach' | awk '{print $2}'| xargs kill -HUP
}
