#######
# ZSH #
#######
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
CASE_SENSITIVE="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [ ! -d $ZSH/custom/plugins/zsh-autosuggestions ];
then
  cp -r /usr/share/zsh/plugins/zsh-autosuggestions $ZSH/custom/plugins/
fi

if [ ! -d $ZSH/custom/plugins/zsh-syntax-highlighting ];
then
  cp -r /usr/share/zsh/plugins/zsh-syntax-highlighting $ZSH/custom/plugins/
fi

source $ZSH/oh-my-zsh.sh

###########
# aliases #
###########
alias copy='xclip -selection c'
alias http='http -v -s monokai'
alias tmux='tmux a || tmux'

##########
# golang #
##########
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#########
# pyenv #
#########
export PYENV_ROOT="$(pyenv root)"

if [ ! -f $PYENV_ROOT/comletions/pyenv.zsh ];
then
  mkdir -p $PYENV_ROOT/comletions/
  cp /usr/share/zsh/site-functions/_pyenv $PYENV_ROOT/comletions/pyenv.zsh
fi

source $PYENV_ROOT/comletions/pyenv.zsh
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
