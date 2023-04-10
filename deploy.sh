#!/bin/bash
# 配置したい設定ファイル
dotfiles=(.zshrc .gitconfig .gitconfig.user .gitmodules .vimrc .vim/ .zsh/)

# 設定ファイルのシンボリックリンクをホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
  ln -svf ~/works/dotfiles/$file ~
done

