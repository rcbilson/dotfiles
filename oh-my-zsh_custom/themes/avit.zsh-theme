# AVIT ZSH Theme

# settings
typeset +H _current_dir="%{$fg_bold[blue]%}%3~%{$reset_color%} "
typeset +H _return_status="%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"
typeset +H _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

PROMPT='
$(_user_host)${_current_dir} %{$fg[yellow]%}${AWS_PROFILE+🅰 }${AWS_PROFILE}%{$reset_color%}
%{%(!.${fg[red]}.${fg[white]})%}>%{$reset_color%} '

PROMPT2='%{%(!.${fg[red]}.${fg[white]})%}◀%{$reset_color%} '

__RPROMPT='$(vi_mode_prompt_info)%{$(echotc UP 1)%}%{$fg[white]%}$(date -R)%{$reset_color%} ${_return_status}%{$(echotc DO 1)%}'
if [[ -z $RPROMPT ]]; then
  RPROMPT=$__RPROMPT
else
  RPROMPT="${RPROMPT} ${__RPROMPT}"
fi

function _user_host() {
  local me
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USERNAME ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLORS='mt=1;33'
