if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Set line number on left
set number

"" Set location for fzf
set rtp+=/usr/local/opt/fzf
"" Default vim with Ubuntu does not have true color support
"" set termguicolors 
set t_Co=256

"" Plugins, using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'aonemd/kuroi.vim'
Plug 'preservim/nerdtree'
call plug#end()

set background=dark
colorscheme kuroi

"" Formatting git commit messsages.
"" Switch on spellcheck and text wrapping to 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72

"" Open NERDTree with CTRL+n
map <C-n> :NERDTreeToggle<CR>

"" https://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program
"" To copy/paste from vim to system clipboard
"" CTRL+V, then highlight whatever text
"" "+y to copy
"" "+p to paste
