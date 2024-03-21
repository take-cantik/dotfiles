# # 読み込み
# # git-promptの読み込み
# source ~/.zsh/.git-prompt.sh
# # git-completionの読み込み
# fpath=(~/.zsh $fpath)
# zstyle ':completion:*:*:git:*' script ~/.zsh/.git-completion.bash
#
# # 単語の区切り文字を指定する
# autoload -Uz select-word-style
# select-word-style default
# # ここで指定した文字は単語区切りとみなされる
# # / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
# zstyle ':zle:*' word-chars " /=;@:{},|"
# zstyle ':zle:*' word-style unspecified
#
# # 補完
# # autoload -Uz compinit && compinit
# # compinit -u
#
# # プロンプトのオプション表示設定
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto
#
# # 補完で小文字でも大文字にマッチさせる
# # zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#
# # ../ の後は今いるディレクトリを補完しない
# # zstyle ':completion:*' ignore-parents parent pwd ..
#
# # sudo の後ろでコマンド名を補完する
# # zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
#  #                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# #
# # ps コマンドのプロセス名補完
# # zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
#
# # 補完に色を付ける
# # zstyle ':completion:*' list-colors "${LS_COLORS}"
#
# # 補完候補をハイライト
# # zstyle ':completion:*:default' menu select=1
#
# ########################################
# # vcs_info
# autoload -Uz vcs_info
# autoload -Uz add-zsh-hook
#
# zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
# zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
#
# function _update_vcs_info_msg() {
#     LANG=en_US.UTF-8 vcs_info
#     RPROMPT="${vcs_info_msg_0_}"
# }
# add-zsh-hook precmd _update_vcs_info_msg
#
# ########################################
# # キーバインド
#
# # ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
# bindkey '^R' history-incremental-pattern-search-backward
#
# # C で標準出力をクリップボードにコピーする
# # mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
# if which pbcopy >/dev/null 2>&1 ; then
#     # Mac
#     alias -g C='| pbcopy'
# elif which xsel >/dev/null 2>&1 ; then
#     # Linux
#     alias -g C='| xsel --input --clipboard'
# elif which putclip >/dev/null 2>&1 ; then
#     # Cygwin
#     alias -g C='| putclip'
# fi
#
# ########################################
# # OS 別の設定
# case ${OSTYPE} in
#     darwin*)
#         #Mac用の設定
#         export CLICOLOR=1
#         alias ls='ls -G -F'
#         ;;
#     linux*)
#         #Linux用の設定
#         alias ls='ls -F --color=auto'
#         ;;
# esac
#
# # テーマ設定
# ZSH_THEME="agnoster"
#
# plugins=(git)
