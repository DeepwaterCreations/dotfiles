set nocompatible
filetype off "Vundle wants this.

set history=256	"256 lines of command line history
set hidden		"Open multiple files without closing the old ones
set nowrap		"Line wrapping off
set number		"Show line numbers

syntax on		"Syntax highlighting
set t_Co=256	"256 colors

"Swap ; and : commands to save a couple of keystrokes:
nnoremap ; :
nnoremap : ;

" Set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" PLUGINS GO HERE
"
" =Examples=
" GitHub Repo:
" Plugin 'tpope/vim-fugitive'
" From vim-scripts.org:
" Plugin 'L9'
" From Git not on GitHub:
" Plugin 'git://git.wincent.com/command-t.git'
" Local:
" Plugin 'file:///home/seawyrm/path/to/plugin'
" See the VundleVim github page for more

" Makes color schemes in terminal-based Vim use full color options available
" in GVim
Plugin 'guicolorscheme.vim'

" Tabbed buffers
Plugin 'fholgado/minibufexpl.vim'

" Fancy statusbar
Plugin 'itchyny/lightline.vim'

" Once the plugins are listed, do :PluginInstall or, from outside vim, 
" vim +PluginInstall +qall
call vundle#end() 
filetype plugin indent on "File type detection + filetype-specific tab behavior.

" MiniBufExpl Settings:
" Wrap buffer movement
let g:miniBufExplCycleArround = 1
" Ctrl-Tab and Ctrl-Shift-Tab switch buffers:
"noremap <C-TAB>   :MBEbn<CR> I'd like to do this, but it turns out Ctrl-Tab
"noremap <C-S-TAB> :MBEbp<CR> isn't a key combo Vim can distinguish.
noremap <TAB> :MBEbn<CR>

" Lightline Settings:
" Hide the default Vim status, since Lightline makes it redundant. 
set noshowmode
" This will ensure the status line displays with only one window.
set laststatus=2
" Lightline general configuration
let g:lightline = {
\	'component': {
\		'readonly': '%{&readonly?"":""}',
\	},
\	'separator': {'left': '', 'right': ''},
\	'subseparator': {'left': '', 'right': ''} 
\}

" Other Keybindings:
" Ctrl-hjkl navigates windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

color oceanblack256

" Put backup files in a specific directory so they don't cause clutter:
set backupdir=~/.vim/tmp,.
