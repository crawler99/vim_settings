" Using vundle to manage plugin
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/ctags.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Color scheme (contain syntax)
colorscheme xoria256

" Navigation
set hlsearch
set ruler

" Paste
set paste

" Editing 
set expandtab
set shiftwidth=4
set tabstop=4

" Ctags config
set tags=./tags,./../tags,./*/tags;
filetype on
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nmap <silent> tl :TlistToggle<cr>
nmap <F9> <C-W>w

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='100,\"500,:200,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Display colored log
" Hit <F8> & Vim will extract all the log lines for the thread that the
" cursor is on & put them in a separate tab
au! Syntax log so ~/.vim/syntax/log.vim
autocmd BufNewFile,BufRead *.log set syntax=log
function ShowThread()
    let bn=expand('%')
    let thread=substitute(getline('.'), ".*\\[\\(.\\)\\].*", "\\1", '')
    tabnew
    execute 'read !echo -e "Log lines for Thread ' . thread . '\n"'
    execute 'read !grep "\[' . thread . '\]" ' . bn
    goto 1
    set syntax=log
    set nomod
endfunction
map <silent> ga :call ShowThread()<cr>
