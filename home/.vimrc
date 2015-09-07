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

call vundle#end() 
filetype plugin indent on "File type detection + filetype-specific tab behavior.

color oceanblack256

" Put backup files in a specific directory so they don't cause clutter:
set backupdir=~/.backup//
