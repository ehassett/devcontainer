cd ~

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=erhbg
export TERM=xterm-256color
export VISUAL=vim
export EDITOR=$VISUAL
export REPO_DIR=$HOME/Repos
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

eval `dircolors ~/.dir_colors/dircolors.256darksolarized`

plugins=(
  git
  golang
  terraform
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Custom aliases
alias c="clear"
alias home="cd ~ && clear"
alias rl="source ~/.zshrc && clear"
alias ud="sudo apt update && sudo apt upgrade -y"
## Terraform aliases
alias tf="terraform"
alias tfa="terraform apply"

# p(rojects) function
compctl -K _p p

_p() {
  local word words completions
  read -cA words
  word="${words[2]}"

  completions="$(ls $REPO_DIR/)"

  reply=("${(ps:\n:)completions}")
}

function p {
  if [[ -d $REPO_DIR/$1 ]]; then
    cd $REPO_DIR/$1
  else
    echo "ERROR: $REPO_DIR/$1 does not exist"
    return 1
  fi
  clear
}

# Add tfvm to PATH
export PATH="$PATH:$HOME/.tfvm/bin"