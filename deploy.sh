#!/bin/bash
# 配置したい設定ファイル
dotfiles=(.zshrc .gitconfig .gitconfig.user .gitmodules .vimrc .yabairc .skhdrc .vim/ .zsh/ '.config/nvim/lua')

# 設定ファイルのシンボリックリンクをホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
  ln -svf ${PWD}/"$file" ~/${file}
done

