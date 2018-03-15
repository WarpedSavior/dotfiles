" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" gg=G Re-indent entire buffer

" Tell vim to remember certain things when we exit
" '10    : marks will be remembered for up to 10 previously edited files
" "100   : will save up to 100 lines for each register
" :20    : up to 20 lines of command-line history will be remembered
" %      : saves and restores the buffer list
" n...   : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" main function that restores the cursor position
function! ResCur()
   if line("'\"") <= line ("$")
      normal! g`"
      return 1
   endif
endfunction

augroup resCur
   autocmd!
   autocmd BufWinEnter * call ResCur()
augroup END

set nocompatible

" change to absolute number lines when in insert mode
set relativenumber number
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
augroup numbertoggle
   autocmd!
   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Syntax highlight etc
filetype on
filetype plugin on
syntax enable

" Autoindent
set autoindent
set cindent 

" Change tab for spaces
set expandtab
set smarttab

" Change size of tab
set shiftwidth=4
set softtabstop=4

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full
" Enable mouse support
set mouse=a

" remap jj to escape in insert mode
inoremap jj <Esc>

" Ignore case etc
set ignorecase
set smartcase

" Incremental searching :)
set incsearch

" Highlight search results
set hlsearch

" Going to next search result will center on the line
map N nzz
map n nzz

" Next Tab
" nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
" nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
" nnoremap <silent> <C-t> :tabnew<CR>

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds
nnoremap <space> za

" Quotation marks
inoremap {      {}<Left>
inoremap {<CR>	{<CR><CR>}<Up>
inoremap "	""<Left>
inoremap '      ''<Left>
inoremap (	()<Left>
inoremap <      <><Left>
inoremap [      []<Left>

" comma or semicolon at the end of string
inoremap ,, <End>,
inoremap ;; <End>;

nnoremap ñ :
filetype plugin indent on
colors jellybeans
