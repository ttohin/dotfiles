" General settings ----------------- {{{
set nocp
filetype plugin on
" drop vi shit
set nocompatible
" do not making backup before editing file
set nobackup
" do not using swapfile
set noswapfile
" number of lines that are remembered
set history=100
" automatically reload file, when it's changed outside of Vim
set autoread
" Maximum number of changes that can be undone
set undolevels=100
" list of character encodings considered when starting to edit an existing file
set fileencodings=utf-8
" share clipboard among instances
set clipboard=unnamed
set modelines=1
set ttyfast
" enable neocomplcache
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_force_overwrite_completefunc = 1
" let g:necoghc_enable_detailed_browse = 1
set backspace=2
" Reload from ~/.vimrc
command ConfigReload source $MYVIMRC
command ConfigOpen open ~/.vimrc
" }}}
" Neobundle plugins ---------------- {{{
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build': {
      \   'mac': 'make -f make_mac.mak',
      \   'linux': 'make -f make_linux.mak'
      \   }
      \}
NeoBundle "regedarek/ZoomWin"
NeoBundle "Shougo/unite.vim"
NeoBundle "airblade/vim-gitgutter"
NeoBundle "dahu/Insertlessly"
NeoBundle "scrooloose/syntastic"
NeoBundle "scrooloose/nerdtree"
NeoBundle 'Valloric/YouCompleteMe', {
\ 'build' : {
\     'linux' : 'git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang',
\     'mac' : 'git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang',
\   },
\ }
NeoBundle "bling/vim-airline"
NeoBundle "spolu/dwm.vim"
NeoBundle "tpope/vim-commentary"
NeoBundle "elzr/vim-json"
NeoBundle "ervandew/supertab"
NeoBundle "wakatime/vim-wakatime"
NeoBundle "morhetz/gruvbox"
NeoBundle "octol/vim-cpp-enhanced-highlight"
NeoBundle "tpope/vim-fugitive"
NeoBundle "chrisbra/vim-diff-enhanced"
NeoBundle "derekwyatt/vim-fswitch"
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "kien/rainbow_parentheses.vim"
NeoBundle "freitass/todo.txt-vim"
" NeoBundle 'edkolev/tmuxline.vim'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" }}}
" Appearance settings ------------- {{{
syntax on
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
set background=dark
" Show the current mode
set showmode
set statusline=%f\ %y\ %{'['.(&fenc!=''?&fenc:&enc).':'.']'}\ %m\ %r\ %=%l,%c/%L
" Show the current command in the bottom right
set showcmd
" Show status line for all files
set laststatus=2
" Show matching brackets
set showmatch
" Do case insensitive matching
set ignorecase
" Ignore case when the pattern contains lowercase letters only.
set smartcase
let g:hybrid_use_Xresources = 1
" colorscheme hybrid
colorscheme gruvbox
set cursorcolumn
set cursorline
"highlight CursorLine ctermbg=000
"highlight CursorColumn ctermbg=000
set relativenumber
set number
" Toggle numberralatives
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
command! Nt call NumberToggle()
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" enable autocomplete
set wildmenu
set wildmode=list:longest,full
" make vim message not to annoy
set shortmess=aoOIT
" always report about changed lines
set report=0
" Don't update the display while executing macros
set lazyredraw
" Nice-looking vertical separator
set fillchars=vert:│
" Cyrillic mapping
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" }}}
" Misc settings ------------------- {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
" matched string is highlighted.
set hlsearch
set incsearch
" lines to scroll when cursor leaves screen
set scrolljump=10
" lines before screen edge to scroll
set scrolloff=1000
" Don't searches wrap around the end of the file
set nowrapscan
" enable wrap
set wrap
" wrap backspace, space, h, l, <-, ->, [ and ] keys
set whichwrap=b,s,<,>,[,],l,h
" set word-wrap, not symbol-wrap
set linebreak
set shell=zsh
autocmd Bufenter *.[cC]apfile,[cC]apfile,*[vV]agrantfile,Guardfile setfiletype ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Bufenter *.md setfiletype markdown
autocmd Bufenter .vim.custom setfiletype vim
" set XML style
" let g:xml_syntax_folding=1
autocmd FileType xml setlocal expandtab shiftwidth=2 softtabstop=2 foldmethod=syntax
autocmd FileType eruby,javascript,sh setlocal expandtab shiftwidth=2 softtabstop=2

" Solve crontab: temp file must be edited in place
autocmd filetype crontab setlocal nobackup nowritebackup
" ingore whitespaces (vimdiff)
" set diffopt+=iwhite " ignore whitespaces
" highlight trailing spaces
set list!
set listchars=tab:»»,trail:∘
" disable matches in help buffers
autocmd BufEnter,FileType help call clearmatches()
" chmod +х
function ModeChange()
  if getline(1) =~ '^#!'
    silent !chmod a+x <afile>
  endif
endfunction
" autocmd BufWritePost * call ModeChange()
" preserve undo actions even after file has closed
set undolevels=1000
set undofile
" vim-latex settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
" save after losing focus
autocmd FocusLost * :wa
" clear signcolumn for Syntastic and GitGutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=002 ctermbg=002
highlight GitGutterChange ctermfg=002 ctermbg=002
highlight GitGutterDelete ctermfg=009 ctermbg=009
highlight GitGutterChangeDelete ctermfg=009 ctermbg=009
if &term =~ '^screen'
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
let custom_filename = '.vim.custom'
if filereadable(custom_filename)
  execute "source" custom_filename
endif
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:EasyMotion_smartcase = 1

" rainbow parentheses
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
" }}} "
" Key mapping settings ------------ {{{
let mapleader = ","
" remove search highlighting
nmap <Leader>nh :nohlsearch<CR>
" set paste mode
set pastetoggle=<F3>
noremap k gk
noremap j gj
" save as root with w!!
cmap w!! w !sudo tee % > /dev/null
" disable arrow keys in insert and normal modes
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" nmap <Leader>s :%!git stripspace<CR>
nmap <F6> :%s/<c-r><c-w>//gc<left><left><left>
" nmap gd :tjump <c-r><c-w><CR>
" Close all active windows
nmap <Leader>q :qa!<CR>
" Hide/Restore current window
noremap <Leader>wc :ZoomWin<CR>
"Toggle .h/.cpp file
nnoremap <silent> <Leader>h :FSSplitLeft<CR>

nmap s <Plug>(easymotion-s2)

nnoremap <silent> <Leader>cd :CopyDefinition<CR>
nnoremap <silent> <Leader>id :ImplementDefinition<CR>

" }}}
" Unite --------- {{{
if executable('ag')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_history_yank_enable = 1
nnoremap <Leader>f :Unite -buffer-name=search -start-insert line<cr>
nnoremap <Leader>F :Unite grep:.<cr>
nnoremap <silent> <leader>t :Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr>
nnoremap <leader>y :<C-u>Unite -auto-resize -toggle -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -auto-resize -toggle -buffer-name=buffer  buffer<cr>

let g:unite_candidate_icon = '-'
let g:unite_marked_icon = '+'
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

if !exists('g:unite_ignores')
  let g:unite_ignores = []
endif

let g:unite_ignores += ['\.git']

call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', unite#get_all_sources('file_rec')['ignore_pattern'] .
      \ join(g:unite_ignores, '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" sort file results by length
call unite#custom#source('file', 'sorters', 'sorter_length')
call unite#custom#source('file_rec/async', 'sorters', 'sorter_length')

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  map <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  map <silent><buffer> <ESC> <Plug>(unite_exit)
  imap <silent><buffer><expr> <C-v> unite#do_action('split')
endfunction

autocmd FileType unite call s:unite_settings()
" }}}
" Vimscript file settings ---------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Ultisnips ---------- {{{
let g:UltiSnipsExpandTrigger="<Leader>us"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
" YouCompleteMe C++ ------ {{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_cache_omnifunc = 1
set completeopt-=preview
let g:ycm_filetype_blacklist = {
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'log' : 0
      \ }
" }}}
