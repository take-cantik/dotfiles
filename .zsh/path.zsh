# php
export PATH="/usr/local/opt/php@8.0/bin:$PATH"
export PATH="/usr/local/opt/php@8.0/sbin:$PATH"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=/usr/local/texlive/2021/bin/universal-darwin:$PATH

# rbenv
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
