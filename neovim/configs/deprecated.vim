Plug 'Neur1n/solarized_flood'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlP'}
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}
Plug 'lervag/vimtex' " , {'for': ['tex']}
Plug 'nathanaelkane/vim-indent-guides', {'for': ['c', 'cpp', 'python']}
Plug 'will133/vim-dirdiff', {'on': 'DirDiff'}

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-go', {'for': 'go'}
Plug 'ncm2/ncm2-jedi', {'for': 'python'}
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang', {'for': ['c', 'cpp']}
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-ultisnips', {'for': ['c', 'cpp', 'go', 'python', 'tex', 'vim']}
Plug 'ncm2/ncm2-vim', {'for': 'vim'}

"******************************************************************************
"                                                   iamcco/markdown-preview.vim
"******************************************************************************
let g:mkdp_refresh_slow = 1
nmap <silent> <leader>mp <Plug>MarkdownPreview
nmap <silent> <leader>ms <Plug>StopMarkdownPreview

"******************************************************************************
"                                                                 lervag/vimtex
"******************************************************************************
" let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'E:\ProgramFiles\SumatraPDF\SumatraPDF.exe'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_latexmk_options =
    \ 'xelatex -verbose -file-line-error '.
    \ '-synctex=1 -shell-escape -interaction=nonstopmode $*'

if !exists('g:vimtex_compiler_latexmk')
    let g:vimtex_compiler_latexmk = {}
endif

let g:vimtex_compiler_latexmk = {
    \ 'build_dir': './build/',
    \ 'callback': 1,
    \ 'continuous': 0,
\ }

"******************************************************************************
"                                                                   ncm-2/ncm-2
"******************************************************************************
set completeopt=noinsert,menuone,noselect
let g:ncm2_pyclang#clang_path = '/usr/bin/clang++-6.0'
let g:ncm2_pyclang#library_path = '/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'
let g:ncm2_pyclang#database_path = [
            \ 'compile_commands.json',
            \ 'build/compile_commands.json',
            \ ]

inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<C-y>\<CR>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>" ))
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup ncm2
    autocmd InsertEnter * call ncm2#enable_for_buffer()
    autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
augroup END

augroup ncm_tex
    autocmd!
    autocmd InsertEnter * call ncm2#enable_for_buffer()
    autocmd Filetype tex call ncm2#register_source({
        \ 'name': 'vimtex',
        \ 'priority': 8,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \                  {'name': 'abbrfuzzy', 'key': 'menu'},
        \                  {'name': 'prefix', 'key': 'word'},
        \             ]
        \            },
        \ 'mark': 'tex',
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
augroup END

imap <silent> <expr> <C-s> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
smap <C-s> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'

"******************************************************************************
"                                                          Shougo/deoplete.nvim
"                                                          zchee/deoplete-clang
"******************************************************************************
let g:deoplete#enable_at_startup=1
call deoplete#custom#option({
    \ 'auto_complete_delay': 0,
    \ 'smart_case': v:true,
\ })
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

let g:deoplete#sources#clang#libclang_path='/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-6.0/lib/clang/6.0.1/include/'