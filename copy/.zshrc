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

# tf_prompt_info function
## Outputs the current Terraform workspace if .terraform exists
function tf_prompt_info {
  if [[ -d ./.terraform ]]; then
    echo "tf:($(terraform workspace show))"
  else
    echo ""
  fi
}

# prompt_info function
## Wrapper function for zsh prompt info
function prompt_info {
  if [[ -z $1 ]]; then
    echo "%{\e[0;36m%}$2"
  elif [[ -z $2 ]]; then
    echo "%{\e[0;36m%}$1"
  else
    echo "%{\e[0;36m%}$1%{\e[1;91m%}|%{\e[0;36m%}$2"
  fi
}

# Add tfvm to PATH
export PATH="$PATH:$HOME/.tfvm/bin"