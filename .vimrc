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

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    " Better mouse support, see  :help 'ttymouse'
    "set ttymouse=sgr

    " Enable true colors, see  :help xterm-true-color
    let &termguicolors = v:true
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " Enable bracketed paste mode, see  :help xterm-bracketed-paste
    let &t_BE = "\<Esc>[?2004h"
    let &t_BD = "\<Esc>[?2004l"
    let &t_PS = "\<Esc>[200~"
    let &t_PE = "\<Esc>[201~"

    " Enable focus event tracking, see  :help xterm-focus-event
    let &t_fe = "\<Esc>[?1004h"
    let &t_fd = "\<Esc>[?1004l"
    execute "set <FocusGained>=\<Esc>[I"
    execute "set <FocusLost>=\<Esc>[O"

    " Enable modified arrow keys, see  :help arrow_modifiers
    execute "silent! set <xUp>=\<Esc>[@;*A"
    execute "silent! set <xDown>=\<Esc>[@;*B"
    execute "silent! set <xRight>=\<Esc>[@;*C"
    execute "silent! set <xLeft>=\<Esc>[@;*D"
endif

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

autocmd FileType make iunmap <Tab>
autocmd FileType make iunmap <S-Tab>
autocmd FileType make set noexpandtab

call plug#begin()

" List your plugins here
Plug 'vimwiki/vimwiki'

call plug#end()

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
