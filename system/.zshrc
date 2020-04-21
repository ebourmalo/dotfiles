HOMEDIR=${ZDOTDIR:-$HOME}

source $HOMEDIR/.env

# Source Prezto.
if [[ -s "$HOMEDIR/.zprezto/init.zsh" ]]; then
  source "$HOMEDIR/.zprezto/init.zsh"
fi

zstyle ':prompt:pure:prompt:success' color yellow