" General settings ----------------- {{{
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
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:necoghc_enable_detailed_browse = 1
set backspace=2
" }}}
" Neobundle plugins ---------------- {{{
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build': {
      \   'mac': 'make -f make_mac.mak',
      \   'linux': 'make -f make_linux.mak'
      \   }
      \}
" NeoBundle "Shougo/neocomplcache"
NeoBundle "vim-scripts/ZoomWin"
NeoBundle "Shougo/unite.vim"
NeoBundle "honza/vim-snippets"
NeoBundle "SirVer/ultisnips"
NeoBundle "airblade/vim-gitgutter"
NeoBundle "dahu/Insertlessly"
NeoBundle "godlygeek/tabular"
NeoBundle "scrooloose/syntastic"
NeoBundle "scrooloose/nerdtree"
NeoBundle 'Valloric/YouCompleteMe', {
\ 'build' : {
\     'linux' : 'git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang',
\     'mac' : 'git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang',
\   },
\ }
NeoBundle "bling/vim-airline"
" NeoBundle "Rip-Rip/clang_complete"
NeoBundle "spolu/dwm.vim"
NeoBundle "tpope/vim-commentary"
NeoBundle "tpope/vim-surround"
NeoBundle "ujihisa/neco-ghc"
NeoBundle "jvoorhis/coq.vim"
NeoBundle "trefis/coquille"
NeoBundle "def-lkb/vimbufsync"
NeoBundle "merlinrebrovic/focus.vim"
NeoBundle "elzr/vim-json"
NeoBundle "bitc/vim-hdevtools"
" NeoBundle "kongo2002/fsharp-vim"
" NeoBundle "kchmck/vim-coffee-script"
NeoBundle "w0ng/vim-hybrid"
NeoBundle "wting/rust.vim"
NeoBundle "octol/vim-cpp-enhanced-highlight"
NeoBundle "kien/ctrlp.vim"
NeoBundle "tpope/vim-fugitive"
NeoBundle "ervandew/supertab"
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
colorscheme hybrid
set cursorcolumn
set cursorline
highlight CursorLine ctermbg=000
highlight CursorColumn ctermbg=000
set relativenumber
" Toggle numberralatives
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
command Nt :call NumberToggle()<cr>
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
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
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['cpp', 'c', 'h', 'hpp'], 'passive_filetypes': ['tex','java']}
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args = '--ignore=E501'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
autocmd Bufenter *.[cC]apfile,[cC]apfile,*[vV]agrantfile,Guardfile setfiletype ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Bufenter *.md setfiletype markdown
" Use haskell syntax for biegunkofiles
autocmd Bufenter *.biegunka setfiletype haskell
" set XML style
" let g:xml_syntax_folding=1
autocmd FileType xml setlocal expandtab shiftwidth=2 softtabstop=2 foldmethod=syntax
autocmd FileType eruby,javascript,sh setlocal expandtab shiftwidth=2 softtabstop=2
" ingore whitespaces (vimdiff)
set diffopt+=iwhite " ignore whitespaces
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
autocmd BufWritePost * call ModeChange()
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

let g:ctrlp_show_hidden = 1

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
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
autocmd FileType coq call coquille#CoqideMapping()
nmap <Leader>s :%!git stripspace<CR>
nmap <F6> :%s/<c-r><c-w>//gc<left><left><left>
nmap gd :tjump <c-r><c-w><CR>
" Tabularize mappings
let mapleader=','
if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" Close all active windows
nmap <Leader>q :qa<CR>
" Reload from ~/.vimrc
command ConfigReload source $MYVIMRC
command ConfigOpen open ~/.vimrc
" }}}
" Unite --------- {{{
if executable('ack')
" Use ack in unite grep source.
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts =
\ '-i --no-heading --no-color -k -H'
let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_history_yank_enable = 1
nnoremap <Leader>f :Unite grep:%<cr>
nnoremap <Leader>F :Unite grep:.<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files    file_rec/async:!<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -quick-match -buffer-name=buffer  buffer<cr>

let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
" }}}
" Vimscript file settings ---------- {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Haskell settings ------------ {{{
function GenerateHasktags()
call system('hasktags --ignore-close-implementation --ctags . &')
endfunction
augroup filetype_haskell
autocmd!
autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <Leader>sh :%!stylish-haskell<CR>
autocmd FileType haskell iabbrev <buffer> lang {-# LANGUAGE #-}<esc>3hi
autocmd BufWritePost *.hs :HdevtoolsClear " TODO use filetype haskell?
autocmd BufWritePost *.hs call GenerateHasktags() " TODO: why `E488: Trailing characters: :HdevtoolsClear | call " GenerateHasktags()'?
autocmd FileType haskell set commentstring=--\ %s " for vim-commentary
augroup END
highlight hsNiceOperator ctermfg=none ctermbg=black
" configure browser for haskell_doc.vim
let g:haddock_browser = "firefox-bin"
autocmd BufNewFile,BufRead,Bufenter *.nix setfiletype nix
autocmd FileType nix setlocal expandtab shiftwidth=2 softtabstop=2
" syntax rules
let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_debug = 1
let hs_highlight_more_types = 1
let hs_highlight_types = 1
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']
" }}}
" Ultisnips ---------- {{{
let g:UltiSnipsExpandTrigger="<Leader>us"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
" Clang complete ------ {{{
" Disable auto completion, always <c-x> <c-o> to complete
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_periodic_quickfix = 0
let g:clang_close_preview = 1
" Snipmate does not work anymore, ultisnips is the recommended plugin
let g:clang_snippets_engine = 'ultisnips'
" This might change depending on your installation
let g:clang_exec = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang'
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:syntastic_cpp_clang_check_post_args = "~/repos/asynclib/dev_async_framework_asynclib_test/.clang_complete"

" }}}
" C++ stuff ------- {{{
command! CopyDefinition :call s:GetDefinitionInfo()
command! ImplementDefinition :call s:ImplementDefinition()
function! s:GetDefinitionInfo()
  exe 'normal ma'
  " Get class
  call search('^\s*\<class\>', 'b')
  exe 'normal ^w"ayw'
  let s:class = @a
  let l:ns = search('^\s*\<namespace\>', 'b')
  " Get namespace
  if l:ns != 0
    exe 'normal ^w"ayw'
    let s:namespace = @a
  else
    let s:namespace = ''
  endif
  " Go back to definition
  exe 'normal `a'
  exe 'normal "aY'
  let s:defline = substitute(@a, ';\n', '', '')
endfunction

function! s:ImplementDefinition()
  call append('.', s:defline)
  exe 'normal j'
  " Remove keywords
  s/\<virtual\>\s*//e
  s/\<static\>\s*//e
  if s:namespace == ''
    let l:classString = s:class . "::"
  else
    let l:classString = s:namespace . "::" . s:class . "::"
  endif
  " Remove default parameters
  s/\s\{-}=\s\{-}[^,)]\{1,}//e
  " Add class qualifier
  exe 'normal ^f(bi' . l:classString
  " Add brackets
  exe "normal $o{\<CR>\<TAB>\<CR>}\<CR>\<ESC>kkkk"
  " Fix indentation
  exe 'normal =4j^'
endfunction
" set conceallevel=2
" set concealcursor=vin
" let g:clang_snippets=1
" let g:clang_conceal_snippets=1
" The single one that works with clang_complete
" let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to aways
" show menu)
" set completeopt=menu,menuone

" Limit popup menu height
" set pumheight=20

" SuperTab completion fall-back
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
" }}}
