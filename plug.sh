#! /usr/bin/env bash

# MVIM_HOME=$HQ/config/minivim

# MVIM_HOME=$PWD
VIM=${HQ_VIM_HOME:-$HOME/HQ/conf/vim/vimt}
MVIM_HOME=$VIM
MVIM_PACK=$MVIM_HOME/runtime/pack

# Zsh
# plugins=(tpope/vim-sensible sheerun/vim-polyglot)

# Bash
# Plug 'roxma/nvim-yarp'
# Plug 'ncm2/ncm2'
# " Fast python completion (use ncm2 if you want type info or snippet support)
# Plug 'HansPinckaers/ncm2-jedi'
# " Words in buffer completion
# Plug 'ncm2/ncm2-bufword'
# " Filepath completion
# Plug 'ncm2/ncm2-path'

plugins=("tpope/vim-sensible \
  neoclide/coc.nvim \
  vim-airline/vim-airline-themes \
  tmhedberg/SimpylFold \
  vim-scripts/indentpython.vim \
  sheerun/vim-polyglot \
  bling/vim-airline \
  kien/rainbow_parentheses.vim \
  tpope/vim-endwise \
  tpope/vim-commentary \
  mhartington/oceanic-next \
  jaredgorski/SpaceCamp \
  jonathanfilip/vim-lucius \
  vimwiki/vimwiki \
  jiangmiao/auto-pairs \
  honza/vim-snippets")

  # davidhalter/jedi-vim \
  # tweekmonster/impsort.vim \
  # w0rp/ale \
  # roxma/vim-hug-neovim-rpc \
  # roxma/nvim-yarp \
  # ncm2/ncm2 \
  # HansPinckaers/ncm2-jedi \
  # ncm2/ncm2-bufword \
  # ncm2/ncm2-path \
down() {
    echo "Plug: $1 installing"
    echo "URL: $URL"
    echo "DIST: $DIST"
    git clone --recursive $URL $DIST
    echo "Plug: $1 installed"
}

install() {
  REPO_ID=$1
  # URL="https://github.com/"$1".git"
  URL="https://hub.fastgit.xyz/"$1".git"
  ORG_ID=${REPO_ID%%\/*}
  PACK_ID=`expr "$REPO_ID" : '.*\/\(.*\)'`
  DIST=$MVIM_PACK/$ORG_ID/start/$PACK_ID

  if [[ ! -d $DIST ]]; then
    down $REPO_ID
  else
    if [[ $1 = '-f' ]] ; then
      BACKUP_AT=$(date +"%F%T" | tr -d '\-:')
      mv $DIST ${DIST}_${BACKUP_AT}
      down $REPO_ID
    else
      echo "Plug: $1 installed"
      echo "Use -f to reinstalled"
    fi
  fi
}  

for plug in $plugins; do
  install $plug
done
