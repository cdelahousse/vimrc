#My .vimrc

Here are my vim settings, documented and laid out all cool. I've included
references where necessary.

#Install

1. Clone this repo into some folder. Copy it to your home folder


		$> git clone https://github.com/cdelahousse/vimrc.git

		$> mv vimrc ~/.vim/

		$> cd ~/vim/


1. Edit the g:my_vim_path variable within vimrcLOCAL to reflect the cloned directory
above.


		let g:my_vim_path	= '~/.vim'


1. Delete the section of said file you don't need. Either the Windows or Linux
section.

1. Copy the vimrcLOCAL text file to your home directory and rename it to .vimrc

		$> mv vimrcLOCAL ~/.vimrc

1. Clone the vundle vim plugin manager into the bundle directory

		$> cd bundle

		$> git clone git://github.com/gmarik/vundle.git

1. Open vim to get Vundle to download all the extensions into ~/.vim/bundle

		:BundleInstall!
