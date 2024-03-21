source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-completions'
# 入力途中に候補をうっすら表示
zplug "zsh-users/zsh-autosuggestions"
# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting"
# 自分自身をプラグインとして管理
zplug "zplug/zplug", hook-build:'zplug --self-manage'

autoload -Uz compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zplug load
