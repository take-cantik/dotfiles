############################
# 分割ファイルの読み込み
############################
ZSHHOME="${HOME}/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# 色を使用出来るようにする
export BAT_THEME="Monokai Extended Bright"
autoload -Uz colors
colors

# エディタをvimに設定
export EDITOR=vim

# vi 風キーバインドにする
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey -v '^?' backward-delete-char

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
VIMODE="[INS]"
function zle-line-init zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/${fg[yellow]}[NOR]${reset_color}}/(main|viins)/${fg[blue]}[INS]${reset_color}}"

  PROMPT="%{$fg[green]%} %~ %{${reset_color}%}
${VIMODE} $ "

  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# #を打つと\#に変換する
function auto-escape() {
  LBUFFER+="\\"
  zle self-insert
}

zle -N auto-escape
bindkey -v "#" auto-escape
bindkey -v "^" auto-escape

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob



# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# php
export PATH="/usr/local/opt/php@8.0/bin:$PATH"
export PATH="/usr/local/opt/php@8.0/sbin:$PATH"


export PATH="$HOME/.poetry/bin:$PATH"
export PATH=/usr/local/texlive/2021/bin/universal-darwin:$PATH

export PATH=$PATH:/usr/local/bin
export PATH="$HOME/.rbenv/bin:$PATH"

# homebrew for M2 Mac
eval "$(/opt/homebrew/bin/brew shellenv)"

# anyenv
eval "$(anyenv init -)"


# bun completions
[ -s "/Users/take_cantik/.bun/_bun" ] && source "/Users/take_cantik/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/take_cantik/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
