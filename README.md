# My .vimrc

My .vimrc and all the settings I've accrued since 2010. It is extensive and well
documented.

# Finicky settings
Some plugins are finicky and can be disabled by setting `g:FINICKY` to 0

## Clean Install

1. Clone this repo into your home folder as `.vim`

    $> cd ~

    $> git clone git://github.com/cdelahousse/vimrc.git .vim

    $> cd ~/.vim/


1. Copy the vimrcLOCAL text file to your home directory and rename it to .vimrc

    $> cp vimrcLOCAL ~/.vimrc

1. Clone the vundle vim plugin manager into the bundle directory

    $> mkdir -p ~/.vim/bundle/

    $> git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

1. Open vim to get Vundle to download all the extensions into ~/.vim/bundle

    :PluginInstall

1. Install dependencies

    jshint
    python-dev
    cmake

1. Build tern and YouCompleteMe
