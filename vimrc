""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------
" VIM configuration file
" ----------------------
"
" Maintainer: Joel Pettersson <petterssonjoel [at] gmail [dot] com>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Vundle required settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/sh
set nocompatible " be iMproved
filetype off "disable file type detection for loading specific options
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'

  " My Bundles here:
  """"""""""""""""""
  Plugin 'LaTeX-Box-Team/LaTeX-Box'
  Plugin 'Rip-Rip/clang_complete'
  Plugin 'SirVer/ultisnips'
  Plugin 'Townk/vim-autoclose'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'bling/vim-airline'
  Plugin 'ekalinin/Dockerfile.vim'
  Plugin 'elzr/vim-json'
  Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'jnurmine/Zenburn'
  Plugin 'jnwhiteh/vim-golang'
  Plugin 'joelpet/vim-ft-config'
  Plugin 'kien/ctrlp.vim'
  Plugin 'lukerandall/haskellmode-vim'
  Plugin 'mileszs/ack.vim'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'sandeepcr529/Buffet.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'sukima/xmledit'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-scripts/darkspectrum'

filetype plugin indent on "enable loading plugins and indents based on file type (required for Vundle)


" => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "drop compatibility for Vi
set ignorecase "ignore case on searches and everywhere else
set infercase "make insert-matching preserve the already written characters
set mouse=a "enable the mouse in compatible terms for all modes
set number "enable line numbers
set smartcase "enable case sensitive search if pattern contains upper case
set wildmenu "show possible completion matches
set wildmode=list:longest "list all matches and complete to longest common string
set scrolloff=3 "minimal number of screen lines to keep above/below the cursor


" => Appearence options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "turn on syntax highlighting
set cursorline "highlight the screen line of the cursor
set ruler "show the line and column number of the cursor position
set laststatus=2 "always show statusline
set t_Co=256
let g:solarized_termcolors=256
set background=light
silent! colorscheme solarized "select colorscheme


" => Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pumheight=10 "maximum number of popup menu items for Insert mode completion
set completeopt=menuone,longest "show menu and complete longest, don't show preview window


" => Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start "intuitive backspacing in insert mode


" => Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent "copy indent from current line when starting a new line
set tabstop=4 "number of spaces that a <Tab> in the file counts for
set softtabstop=4 "number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4 "number of spaces to use for each step of (auto)indent
set expandtab "use the appropriate number of spaces to insert a <Tab>.
set smarttab "makes a <Tab> in front of a line insert blanks according to 'shiftwidth'


" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "," "change map leader (<Leader>)
"LaTeX-Box interfers with ,lv and ,ll in LaTeX-Suite so leave it like this for now.
"let maplocalleader = "," "change map leader (<Leader>)

" Quick Escape
inoremap jk <Esc>
inoremap JK <Esc>

" Switch to current dir
noremap <leader>cd :cd %:p:h<cr>

" Useful newline mapping when between braces. {|} => {\n<indent>|\n}
inoremap <S-CR> <CR><Esc>O


" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Airline
  """"""""""""""""""""""""""""""
  let g:airline_theme = 'solarized'

  " Buffet
  """"""""""""""""""""""""""""""
  noremap <leader>bl :Bufferlistsw<cr>

  " clang_complete
  """"""""""""""""""""""""""""""
  let g:clang_complete_auto=0
  let g:clang_snippets=1
  let g:clang_snippets_engine='ultisnips'
  let g:clang_use_library=1
  nnoremap <Leader>cq :call g:ClangUpdateQuickFix()<CR>

  " CtrlP
  """"""""""""""""""""""""""""""
  nnoremap <Leader>pp :<C-U>CtrlP<CR>
  nnoremap <Leader>pb :<C-U>CtrlPBuffer<CR>
  let g:ctrlp_follow_symlinks = 1
  let g:ctrlp_match_window = 'min:5,max:10,results:100'
  let g:ctrlp_show_hidden = 0
  let g:ctrlp_working_path_mode = 0

  " delimitMate
  """"""""""""""""""""""""""""""
  let delimitMate_excluded_ft = "xml"

  " LatexBox
  """"""""""""""""""""""""""""""
  let g:LatexBox_latexmk_options = "-pvc"
  let g:LatexBox_output_type = "dvi"
  let g:LatexBox_cite_pattern = '\c\\\a*\(cite\|quote\)\a*\*\?\_\s*{'

  " NERD Tree
  """"""""""""""""""""""""""""""
  "Toggle NERD Tree on/off
  nmap <silent> <F4> :NERDTreeToggle<CR>
  "Filter uninteresting files
  let NERDTreeIgnore = ['\.class$']

  " Syntastic
  """"""""""""""""""""""""""""""
  let g:syntastic_c_config_file='.clang_complete'
  let g:syntastic_cpp_config_file='.clang_complete'

  " Tag list
  """"""""""""""""""""""""""""""
  "Toggle Tag list on/off
  nmap <silent> <F5> :TlistToggle<CR>


" => Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Ensure that Vim includes the autocommands only once
if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    "Prevent passwords from `pass` leaking into swap, backup and undo files
    au BufNewFile,BufRead /dev/shm/pass.* setlocal noswapfile nobackup noundofile
endif

