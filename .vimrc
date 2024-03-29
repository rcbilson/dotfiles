set autoindent
set autowrite
set expandtab
set hlsearch
set incsearch
"set re=0
set shiftwidth=8
set hidden

if has("syntax")
        syn on
endif

nnoremap <nowait><silent> <C-L> <C-L>:noh<CR>

nnoremap _ mz:0,$!goimports<CR>'z
"set makeprg=go\ test
nnoremap <F1> :!go doc <cword><CR>

inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
