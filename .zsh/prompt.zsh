# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプト
function zle-line-init zle-keymap-select {
  VIM_NORMAL="%F{yellow}[NOR]%f"
  VIM_INSERT="%F{blue}[INS]%f"
  VIM_MODE="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"

  PROMPT="%{$fg[green]%} %~ %{${reset_color}%}
${VIM_MODE} $ "
  RPROMPT="%{$fg[green]%}$(__git_ps1 "[%s]")%{${reset_color}%}"

  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
