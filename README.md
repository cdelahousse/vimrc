# My .vimrc

My .vimrc and all the settings I've accrued since 2010. It is extensive and well
documented.

## Deploying

Most of my vim settings are kept in Dropbox. Just create a symlink from ~/.vimrc
to ~/PATH/TO/Dropbox/.vimrc.

## Install Scripts

Some plugins need to be compiled or initialized. Just run `install.sh` to have
it done for you.

## Clean Install

1. Clone this repo into your home folder as `.vim`

    $> cd ~

    $> git clone git://github.com/cdelahousse/vimrc.git .vim

    $> cd ~/.vim/


1. Edit the g:my_vim_path variable within vimrcLOCAL to reflect the directory.


    let g:my_vim_path = '~/.vim'


1. Copy the vimrcLOCAL text file to your home directory and rename it to .vimrc

    $> mv vimrcLOCAL ~/.vimrc

1. Clone the vundle vim plugin manager into the bundle directory

    $> cd bundle

    $> git clone git://github.com/gmarik/vundle.git

1. Open vim to get Vundle to download all the extensions into ~/.vim/bundle

    :BundleInstall!

