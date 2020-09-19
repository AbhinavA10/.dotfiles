if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set rtp+=/usr/local/opt/fzf
"" Default vim with Ubuntu does not have true color support
"" set termguicolors 
set t_Co=256

call plug#begin('~/.vim/plugged')

"" Plugins, using vim-plug
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
Plug 'aonemd/kuroi.vim'

call plug#end()

"" color dracula
set background=dark
colorscheme kuroi

"" Formatting git commit messsages.
"" Switch on spellcheck and text wrapping to 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72

