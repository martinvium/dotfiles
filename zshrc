export PATH="/usr/local/bin:$PATH"

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
[ -f /usr/local/opt/fzf/shell/completion.zsh ] && source /usr/local/opt/fzf/shell/completion.zsh
[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh

# Yarn package manager (js)
export PATH="$PATH:`yarn global bin`"

# Probably oracle?
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
# doesn't work?
export NLS_LANG="AMERICAN_AMERICA.UTF8"

# Oracle instantclient x64
# export OCI_DIR="/usr/local/oracle/instantclient_11_2"
# export SQLPATH="/usr/local/oracle/instantclient_11_2"
# export TNS_ADMIN="/usr/local/oracle/network/admin"
export OCI_DIR=$(brew --prefix)/lib


# Editors
export BUNDLER_EDITOR=vim
export EDITOR=vim

# Project specific
export DISABLE_WEBPACK_CHECK_YARN_INTEGRITY=true
export PERSISTENT_CACHE=1

# Load plugins
source ~/.zsh_plugins.sh
export PATH="/usr/local/opt/node@10/bin:$PATH"

# Postgresql
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/u0157541/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/u0157541/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/u0157541/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/u0157541/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
