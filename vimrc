
set nocompatible " Prevent vim from emulating vi's limitations
filetype off
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Set the colorscheme + background
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="middle"
let g:solarized_visibility="high"
colorscheme solarized

" Map the leader key to ,
let mapleader = ","
let g:mapleader = ","

" Set the tabstop to 4 spaces
set tabstop=4
set shiftwidth=4

" auto indent and copy previous indent
set autoindent
set copyindent

" Remove toolbar, menuitem and scrollbar
set go-=m
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R
 
" Setting indent
set smartindent
set cindent

" Highlight searches and show matching parens
set hlsearch
set incsearch
set ignorecase " case insensitive search
set smartcase  " except when caps are present
set showmatch
set showmode " Show current mode
set cursorline " Highlight the current line
set wildmenu
set wildmode=list:longest,full
set modelines=0

" Not available before 7.3 :(
if version >= 730
  " Relative line numbers
  set relativenumber
  " Color column 81 to indicate longer lines
  set colorcolumn=81
endif


" Turn on omni-completion
filetype plugin on
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
let g:SuperTabDefaultCompletionType = "context"


" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set showcmd " Show the command
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids

set hidden " Hide buffers instead of close them

set nowrap
set nobackup
set noswapfile

" Disable the arrow keys!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

scriptencoding utf-8
set history=1000

"set list
set listchars=tab:▸.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set autochdir
set shortmess=aOItT " Avoid 'Hit enter to continue' msg

" Move keys in insert mode
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

" Fix backspace
set backspace=start,indent,eol

" NERDTree
nnoremap<F3> :NERDTreeToggle<CR>
map <silent> <Leader>nt :NERDTreeToggle<CR>

" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
" let g:miniBufExplorerMoreThanOne = 2
" let g:miniBufExplForceSyntaxEnable = 1

" Insert a datetime string
nnoremap<F6>  "=strftime("%F %R (%A)")<CR>P
inoremap<F6>  <C-R>=strftime("%F %R (%A)")<CR> 

" Paste while preserving formatting
imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winnr('$') < 2
      quit!
    endif
  endif
endfunction

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Replacements for copy an paste
map <Leader>y "+Y
vmap <Leader>y "+y
map <Leader>p "+p
map <Leader>P "+P

" Ack plugin
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Comment/markdown functions
map <Leader>1 yypVr=
map <Leader>2 yypVr-

" Remove highlight (Shift + /)
map ? :noh<CR>

" Do not update the screen when executing macros
set lazyredraw

