HOMEDIR=${ZDOTDIR:-$HOME}

source $HOMEDIR/.env
source $HOMEDIR/.alias

# Source Prezto.
if [[ -s "$HOMEDIR/.zprezto/init.zsh" ]]; then
  source "$HOMEDIR/.zprezto/init.zsh"
fi

zstyle ':prompt:pure:prompt:success' color yellow

# shell completions for alacritty
fpath+=$HOMEDIR/.zsh_functions
