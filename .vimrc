" ########################################################
" ###################### VIM CONFIG ######################
" ########################################################



" ###########################
" ######### PLUGINS #########
" ###########################

" Required for vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" #######################
" ## vim-plugin config ##
" #######################

call plug#begin(data_dir . '/plugged')

 	" NERD tree will be loaded on the first invocation of NERDTreeToggle command
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	
	" Theme
	Plug 'altercation/vim-colors-solarized'
	
	" Statusline
	Plug 'itchyny/lightline.vim'
	
	" Git diff
	Plug 'airblade/vim-gitgutter'
	
	" Multiple cursors
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()



" ######################
" ### General Config ###
" ######################

syntax enable

" Show line numbers
set number

" Spaces for one tab
set tabstop=2

" Spaces for one level of indentation
set shiftwidth=2

" Expand tab to spaces
set expandtab

" Auto indentation
set autoindent

" Required for lightline
set laststatus=2

" Theme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Use css syntax highlighting for rasi
au BufNewFile,BufRead /*.rasi setf css

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



" #######################
" ##### Keymappings #####
" #######################

nnoremap <C-t> :NERDTreeToggle<CR>

"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

