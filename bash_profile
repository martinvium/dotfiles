source ~/.bashrc
source ~/.bash_secrets

# RBENV
eval "$(rbenv init -)"

# Git branch in prompt.
parse_git_branch() {
  if [ -d ".git" ]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  fi
}
export PS1="\u@\h:\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/Projects/go

# FZF Search
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git --ignore .hg -g ''"

# Yarn package manager (js)
export PATH="$PATH:`yarn global bin`"
