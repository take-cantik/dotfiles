#!/bin/bash
# 配置したい設定ファイル
dotfiles=(.zshrc .gitconfig .gitconfig.user .gitmodules .vimrc .yabairc .skhdrc)

# 設定ファイルのシンボリックリンクをホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
  ln -svf ${PWD}/"$file" ~
done

# 配置したい設定ファイル
dotfolders=(.vim/ .zsh/)

# 設定フォルダのシンボリックリンクをホームディレクトリ直下に作成する
for folder in "${dotfolders[@]}"; do
  ln -svf ${PWD}/"$folder" ~
done

#.config以下の設定ファイルを配置する
configfolders=(nvim/ gh/ alacritty/)

for folder in "${configfolders[@]}"; do
  sudo ln -svf ${PWD}/.config/"$folder" ~/.config
done

