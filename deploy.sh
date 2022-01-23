#!/bin/bash
# 配置したい設定ファイル
dotfiles=(.zshrc .gitconfig .gitconfig.user .vimrc)

# 設定ファイルのシンボリックリンクをホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
  ln -sv ~/dotfiles/$file ~
done

