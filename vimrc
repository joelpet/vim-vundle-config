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
  Bundle 'Townk/vim-autoclose'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
  Bundle 'jnurmine/Zenburn'
  Bundle 'kien/ctrlp.vim'
  Bundle 'mileszs/ack.vim'
  Bundle 'sandeepcr529/Buffet.vim'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/syntastic'
  Bundle 'sukima/xmledit'
  Bundle 'tomtom/checksyntax_vim'
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
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized "select colorscheme


" => Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start "intuitive backspacing in insert mode


" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Ack
  """"""""""""""""""""""""""""""
  let g:ackprg="ack-grep --with-filename --nocolor --nogroup --column"

  " delimitMate
  """"""""""""""""""""""""""""""
  let delimitMate_excluded_ft = "xml"

  " LatexBox
  """"""""""""""""""""""""""""""
  let g:LatexBox_latexmk_options = "-pvc"
  let g:LatexBox_output_type = "dvi"
  let g:LatexBox_cite_pattern = '\c\\\a*\(cite\|quote\)\a*\*\?\_\s*{'


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
let maplocalleader = "," "change map leader (<Leader>)

" Quick Escape
inoremap jk <Esc>

" Switch to current dir
noremap <leader>cd :cd %:p:h<cr>

" Useful newline mapping when between braces. {|} => {\n<indent>|\n}
inoremap <S-CR> <CR><Esc>O


  " Buffet
  """"""""""""""""""""""""""""""
  noremap <leader>bl :Bufferlistsw<cr>

  " clang_complete
  """"""""""""""""""""""""""""""
  let g:clang_use_library=1
  nnoremap <Leader>cq :call g:ClangUpdateQuickFix()<CR>

  " NERD Tree
  """"""""""""""""""""""""""""""
  "Toggle NERD Tree on/off
  nmap <silent> <F4> :NERDTreeToggle<CR> 
  "Filter uninteresting files
  let NERDTreeIgnore = ['\.class$']
  
  " Tag list
  """"""""""""""""""""""""""""""
  "Toggle Tag list on/off
  nmap <silent> <F5> :TlistToggle<CR>

  " Check Syntax
  """"""""""""""""""""""""""""""
  " Explicit syntax check (mnemonic: sc)
  noremap <silent> <leader>sc :CheckSyntax<cr>

