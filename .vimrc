set autoindent
set autowrite
set expandtab
set hlsearch
set incsearch
set re=0
set shiftwidth=2
set hidden
set path=.,,./**
set background=dark

syn on

" normal mode mappings
nnoremap <nowait><silent> <C-L> <C-L>:noh<CR>

" insert mode mappings
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>

" Go settings
autocmd FileType go nnoremap _ mz:0,$!goreturns<CR>'z
autocmd FileType go nnoremap <nowait><silent> = :s;^;//;<CR>:noh<CR>j
autocmd FileType go nnoremap <nowait><silent> + :s;//;;<CR>:noh<CR>j
autocmd FileType go vnoremap <nowait><silent> = :s;^;//;<CR>:noh<CR>
autocmd FileType go vnoremap <nowait><silent> + :s;//;;<CR>:noh<CR>
autocmd FileType go se shiftwidth=8
autocmd FileType go se makeprg=go\ test\ -short\ -cover

autocmd FileType markdown se shiftwidth=4
autocmd FileType markdown nnoremap _ gqip

autocmd FileType python se shiftwidth=4

autocmd FileType javascript se shiftwidth=2
autocmd FileType typescript se shiftwidth=2
autocmd FileType typescriptreact se shiftwidth=2

autocmd FileType makefile iunmap <Tab>
autocmd FileType makefile iunmap <S-Tab>
