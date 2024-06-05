# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#######
# ZSH #
#######
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"

plugins=(
  docker
  docker-compose
  fzf-tab
  git
  kubectl
  rust
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

###########
# aliases #
###########
alias http='http -v -s monokai'
alias vim='nvim'
alias n='neovide'
function t() {
    (tmux a -d -t $1 2>&1 >/dev/null) || (tmux new -s $1)
}

##########
# golang #
##########
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

############
# Homebrew #
############
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export LD_LIBRARY_PATH="${HOMEBREW_PREFIX}/lib"
export LIBRARY_PATH="${HOMEBREW_PREFIX}/lib"

#######
# FZF #
#######
export PATH="$HOME/.fzf/bin:$PATH"
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --exclude .git'
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --exclude .git . "$1"
}
source $HOME/.fzf/fzf-git.sh/fzf-git.sh

#########
# pyenv #
#########
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

################
# ssh add keys #
################
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_ecdsa
fi

fpath+=~/.zfunc
autoload -Uz compinit
compinit

############
# Just env #
############
export PATH="$HOME/.local/share/nvim/mason/bin:$HOME/.local/bin:$PATH"
export VISUAL="nvim"
