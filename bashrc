export PATH=$HOME/bin:/usr/local/sbin:$PATH
export PATH="$GOPATH/bin:$PATH"

# Oracle instantclient x64
export OCI_DIR="/usr/local/oracle/instantclient_11_2"
export SQLPATH="/usr/local/oracle/instantclient_11_2"
export TNS_ADMIN="/usr/local/oracle/network/admin"

export NLS_LANG="AMERICAN_AMERICA.UTF8"
export TWO_TASK=SALORMA
export ORACLE_SID=SALORMA

# Editors
export BUNDLER_EDITOR=vim
export EDITOR=vim

# Docker shizzle
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/martinv/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

