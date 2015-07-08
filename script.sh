#!/bin/sh

install() {
#  if [ -d "$HOME/.vi/bund le/" ]; then
if [-d "$HOME/.vim/bundle/"]; then
     rm -fr  ~/.vim/bundle
#    mv ~/.vim ~/.vim.`date +%Y%m%d%H%M%S`
  fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  if [ -f "$HOME/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc.`date +%Y%m%d%H%M%S`
  fi

# copy .vimrc file from remote sever
curl "https://raw.githubusercontent.com/weiweifu/My-Vim-Configure/master/vimrc" >.vimrc

  vim +BundleInstall! +qall! </dev/tty

  #(cd ~/.vim/bundle/YouCompleteMe; ./install.sh --clang-completer)
}

update() {
  vim +BundleClean +BundleInstall +qall! </dev/tty
}

for arg in "$@"
do
  case $arg in 
    install)
      install;
      break;
      ;;
    update)
      update;
      break;
      ;;
  esac
done
