"*********************************************************** Moduled Configs{{{
source $VIMCONFIG/configs/keymap.vim
" source $VIMCONFIG/configs/abbrev.vim
source $VIMCONFIG/configs/plugin_list.vim
source $VIMCONFIG/configs/plugin_conf.vim
"}}}

"************************************************************************ UI{{{
let $LANG='en'                                           " set message language
set langmenu=en                                             " set menu language
let g:netrw_winsize=15                     " set explorer window width to be 30
let g:netrw_liststyle=3                         " set explorer to be tree style

if has('mouse')
  set mouse=a
endif
"}}}

"*********************************************************** Moduled Configs{{{
source $VIMCONFIG/configs/autocmd.vim
"}}}

"****************************************************************** Encoding{{{
if has('multi_byte')
  if &termencoding ==# ''
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=utf-8,gbk,gb2312,gb18030
endif
"}}}

"******************************************************************* General{{{
set autoindent                                           " set auto indentation
set backspace=indent,start                       " for vim-latex, see issue #53
set colorcolumn=80                                          " show right margin
set cursorline                                          " highlight current row
set expandtab shiftwidth=2 softtabstop=2     " set <Tab> width to be 2 <space>s
set fillchars=vert:\|
set guicursor+=a:blinkon0
set tabstop=2                                " make real <Tab> to be width of 2
set hlsearch
set iminsert=0 imsearch=0                                " make IME more usable
set foldmethod=indent                      " fold code according to indentation
set foldlevelstart=99                              " start with no folds closed
set incsearch                                              " incremental search
set laststatus=2                           " show statusline even only 1 window
set linespace=0                                         " set line spacing to 0
set noshowmode
set number                                                   " show line number
set relativenumber                                       " relative line number
set sessionoptions-=folds                 " do not create folds when sessioning
set showcmd                                                 " show pressed keys
set signcolumn=yes
set wildmenu                                 " show possible matches when <Tab>
set wildignorecase
set tags+=../tags

set splitright                                            " split on right side
" set splitbelow                                                 " split on below

set backup
set backupdir=$VIMCONFIG/recovery/backup
"}}}
