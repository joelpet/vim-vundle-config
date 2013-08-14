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
filetype off "disable file type detection for loading specific options
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

  " My Bundles here:
  """"""""""""""""""
  Bundle 'LaTeX-Box-Team/LaTeX-Box'
  Bundle 'Rip-Rip/clang_complete'
  Bundle 'SirVer/ultisnips'
  Bundle 'Townk/vim-autoclose'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'bling/vim-airline'
  Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
  Bundle 'jnurmine/Zenburn'
  Bundle 'jnwhiteh/vim-golang'
  Bundle 'joelpet/vim-ft-config'
  Bundle 'kien/ctrlp.vim'
  Bundle 'lukerandall/haskellmode-vim'
  Bundle 'mileszs/ack.vim'
  Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'sandeepcr529/Buffet.vim'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/syntastic'
  Bundle 'sukima/xmledit'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  Bundle 'tsaleh/vim-matchit'
  Bundle 'vim-scripts/darkspectrum'
  Bundle 'vim-scripts/taglist.vim'

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
syntax on "turn on syntax highlighting
set ruler "show the line and column number of the cursor position
set laststatus=2 "always show statusline
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized "select colorscheme


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

" Switch to current dir
noremap <leader>cd :cd %:p:h<cr>

" Useful newline mapping when between braces. {|} => {\n<indent>|\n}
inoremap <S-CR> <CR><Esc>O


" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Ack
  """"""""""""""""""""""""""""""
  let g:ackprg="ack-grep --with-filename --nocolor --nogroup --column"

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
  nnoremap <C-B> :<C-U>CtrlPBuffer<CR>
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

" Currently no autocommands in use.

"if !exists("autocommands_loaded")
    "let autocommands_loaded = 1
"endif
