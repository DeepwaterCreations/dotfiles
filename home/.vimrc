set nocompatible
filetype off "Vundle wants this. It gets re-enabled below the vundle plugin block.

set history=256	"256 lines of command line history
set hidden		"Open multiple files without closing the old ones
set nowrap		"Line wrapping off
set number		"Show line numbers
"set showmatch           "Highlight matching braces
set wildmode=longest,list  "Autocompletion double-press shows all matches
set lazyredraw "Prevent unnecessary screen redraws

set incsearch "Show search match while still typing

syntax on		"Syntax highlighting
set t_Co=256	"256 colors

"Swap ; and : commands to save a couple of keystrokes:
nnoremap ; :
nnoremap : ;
"Also swap ' and `, since ` is harder to reach and I can't think of
"many situations where I would want to NOT hit the exact column of the mark.
nnoremap ' `
nnoremap ` '
"Select the result of the last Insert-mode typing:
nnoremap gV `[v`]h

" Install built-in matchit plugin
" to expand what % can match/jump to
packadd! matchit

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

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'gitv'

" Personal wiki
Plugin 'vimwiki'

" Easy brackets and HTML tags around things
Plugin 'tpope/vim-surround'

" Syntax error highlighting
Plugin 'scrooloose/syntastic'

" Fuzzy-finder
Plugin 'ctrlpvim/ctrlp.vim'

" Commenting out lines of code
Plugin 'tpope/vim-commentary'

" Auto-generate ctags files
" Plugin 'AutoTag'
" This plugin is broken: It writes warning messages in stupid places on the
" screen and ruins all my formatting.

" Match parens & brackets
Plugin 'luochen1990/rainbow'

" Delete and paste from register in one go
Plugin 'ReplaceWithRegister'

" Plugins work nicely with .
Plugin 'tpope/vim-repeat'

" Edits show up immediately in browser
Plugin 'jaxbot/browserlink.vim'

" Sensible folding in Python files
Plugin 'tmhedberg/SimpylFold'

" Make the built-in file explorer better
Plugin 'tpope/vim-vinegar'

" LaTeX
Plugin 'lervag/vimtex'

" Once the plugins are listed, do :PluginInstall or, from outside vim, 
" vim +PluginInstall +qall
call vundle#end() 
filetype plugin indent on "File type detection + filetype-specific tab behavior. Re-enabling now that Vundle's done doing its thing.

" GuiColorScheme Settings:
runtime! plugin/guicolorscheme.vim
GuiColorScheme oceanblack

" MiniBufExpl Settings:
" Wrap buffer movement
let g:miniBufExplCycleArround = 1
" Ctrl-Tab and Ctrl-Shift-Tab switch buffers:
"noremap <C-TAB>   :MBEbn<CR> I'd like to do this, but it turns out Ctrl-Tab
"noremap <C-S-TAB> :MBEbp<CR> isn't a key combo Vim can distinguish.
"noremap <C-N> :MBEbn<CR>
"noremap <C-P> :MBEbp<CR>

" CtrlP Settings:
" Start searching in open buffers, not files:
let g:ctrlp_cmd = 'CtrlPBuffer'

" Lightline Settings:
" Hide the default Vim status, since Lightline makes it redundant. 
set noshowmode
" This will ensure the status line displays with only one window.
set laststatus=2
" Lightline general configuration
let g:lightline = {
\	'active': {
\		'left': [ [ 'mode', 'paste' ], ['fugitive', 'filename', 'modified']],
\		'right': [ ['syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype' ]]
\	},
\	'inactive': {
\		'left': [['filename', 'modified']], 
\		'right': [['lineinfo'], ['percent']], 
\	},
\	'component': {
\		'readonly': '%{&readonly?"":""}',
\		'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
\	},
\	'component_visible_condition': {
\		'fugitive': '(exists("*fugitive#head")&&""!=fugitive#head())'
\	},
\	'component_expand': {
\		'syntastic': 'SyntasticStatuslineFlag',
\	}, 
\	'component_type': {
\		'syntastic': 'error',
\	},
\	'separator': {'left': "\ue0b0", 'right': "\ue0b2"},
\	'subseparator': {'left': "\ue0b1", 'right': "\ue0b3"} 
\}
" Lightline's help tells me this stuff is useful for Syntastic integration?
" Not totally sure what's going on here, or if I want to add more than just 
" *.c and *.cpp filetypes.
let g:syntastic_mode_map = {'mode': 'passive'}
augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.c,*.cpp,*.py,*.java,*.js call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

" Syntastic Settings:
" Add statusline info (does this work with lightline?)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Enable error signs in the sign column that I may or may not have
let g:syntactic_enable_signs = 1 

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ["python", "pylint2"]
let g:syntastic_python_python_exec = '/usr/bin/python2'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

let g:syntastic_mode_map = {
\       "mode": "active"
\   }

" Rainbow Settings:
let g:rainbow_active = 1

" Vimtex Settings:
let g:vimtex_view_general_viewer = 'apvlv'
let g:vimtex_view_general_options = '@pdf'

" Turn on omnicompletion
set omnifunc=syntaxcomplete#Complete

" Other Keybindings:
" Ctrl-hjkl navigates windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" Put backup files in a specific directory so they don't cause clutter:
set backupdir=~/.vim/tmp,.

" Turn off relative line numbers in insert mode.
set relativenumber
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber
