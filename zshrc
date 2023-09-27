export PATH="$(brew --prefix)/bin:$PATH"

# I prefer not to have autocompletion be case-insensitive, which is the default
export CASE_SENSITIVE="true"

# Prompt
setopt prompt_subst

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PROMPT="%~\$(parse_git_branch)$ "

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"

HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
export MENU_COMPLETE=1

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
source ~/.secrets

# Applications

# Load Rbenv
eval "$(rbenv init -)"

# I've installed zsh installed through Homebrew, so I add these
# lines to make sure tab completion is properly configured
if [ -e $(which brew &> /dev/null && brew --prefix)/etc/zsh_completion ]; then
  source $(brew --prefix)/etc/zsh_completion
fi

# FZF Search
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git --ignore .hg -g ''"
[ -f $(brew --prefix)/opt/fzf/shell/completion.zsh ] && source $(brew --prefix)/opt/fzf/shell/completion.zsh
[ -f $(brew --prefix)/opt/fzf/shell/key-bindings.zsh ] && source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh

# Yarn package manager (js)
export PATH="$PATH:`yarn global bin`"

# Probably oracle?
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
# doesn't work?
export NLS_LANG="AMERICAN_AMERICA.UTF8"

# Oracle instantclient x64
# export OCI_DIR="$(brew --prefix)/oracle/instantclient_11_2"
# export SQLPATH="$(brew --prefix)/oracle/instantclient_11_2"
# export TNS_ADMIN="$(brew --prefix)/oracle/network/admin"
export OCI_DIR=$(brew --prefix)/lib

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /Users/$(whoami)/.pyenv/versions/$(python --version | cut -d' ' -f2)/bin/virtualenvwrapper.sh

# Editors
export BUNDLER_EDITOR=vim
export EDITOR=vim

# Project specific
export PERSISTENT_CACHE=1

# Load plugins
source <(antibody init)

# Postgresql
export PATH="$(brew --prefix)/opt/postgresql@13/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
eval "$(direnv hook zsh)"

# Iterm2 native shell integration?
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$($HOME/code/jin/bin/jin init -)"
eval "$($HOME/code/db-tonic/bin/init)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# aliases
alias ports="lsof -nP -iTCP -sTCP:LISTEN"
alias vim='nvim'
alias y='pnpm'

source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
