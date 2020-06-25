" Encoding
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese

" File format
set fileformats=unix,dos

" Language
set langmenu=zh_CN.UTF-8

" File Type
set ffs=unix,dos,mac

" Hilight Syntax
syntax enable
syntax on

" Color
set background=dark

" Mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" Line Number
set nu
"set rnu
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" List
set nolist
set listchars=tab:\|\ ,nbsp:%,trail:-
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/

" Highlight Search
set hlsearch
" Incremental Searching
set incsearch

" Highlight Line
set cursorline
hi CursorLine	cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Hilight {}
set showmatch

" Compatible
set nocompatible

" No backup
set nobackup

" Backspace
set backspace=indent,eol,start

" No swap file
set noswapfile

" Softtabs, 8 spaces
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

" Auto indent
set autoindent
set cindent

" Make it obvious where 80 characters is
"set textwidth=80
set colorcolumn=+1

"Shortcuts Start
"map
map 9 $
map 0 ^

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Insert mode movement
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <c-h> <left>
inoremap <c-l> <right>

" Leader
let mapleader = ","

" expand tab to space
map <Leader>ts :%retab!<CR>

" Delete windows ^M
map <Leader>rm :%s/\r\m//g<CR>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>
map <Leader>cc :!cscope -bRq<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" Plugin Start
" Taglist
let Tlist_Show_One_File=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_SingleClick=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Process_File_Always=1
nmap <F8> :Tlist<CR>

" CSCOPE
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
set cscopequickfix=s-,c-,d-,i-,t-,e-

function! AutoLoadCTagsAndCScope()
	let max = 5
	let dir = './'
	let i = 0
	let break = 0
	while isdirectory(dir) && i < max
	if filereadable(dir . 'cscope.out')
			execute 'cs add ' . dir . 'cscope.out'
			let break = 1
		endif
		if filereadable(dir . 'tags')
			execute 'set tags =' . dir . 'tags'
			let break = 1
		endif
		if break == 1
			execute 'lcd ' . dir
			break
		endif
		let dir = dir . '../'
		let i = i + 1
	endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>

" gtags
set cscopetag "
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
let gtags_file=findfile("GTAGS", ";")
if !empty(gtags_file)
	exe "cs add" gtags_file
endif

" egrep
let g:EasyGrepMode = 2	   " All:0, Open Buffers:1, TrackExt:2,
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, tags, *.a, *.o"

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <leader>vv :Ack! "<C-R>""<CR>

" LeaderF
" open file search window
let g:Lf_ShortcutF = '<C-P>'
" open buffer search window
"let g:Lf_ShortcutB = '<C-B>'
" auto generate gtags
let g:Lf_GtagsAutoGenerate = 1

" ctrlp
" set runtimepath^=~/.vim/plugin/ctrlp.vim
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip	 " MacOSX/Linux"
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ToggleList
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" YankRing
let g:yankring_replace_n_pkey = '<leader>n'

" undotree
nnoremap <F2> :UndotreeToggle<cr>
if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif

" vim-airline plugin
set laststatus=2

" NERDTree plugin
let NERDTreeWinPos='left'
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', 'cscope*']
map <F5> :NERDTreeToggle<CR>

" Run commands that require an interactive shell
"nnoremap <Leader>r :RunInInteractiveShell<space>

" Run commands in new split buffer
nnoremap <Leader>r :ConqueTermSplit bash<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
nmap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

" EasyMotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" neocomplete {{{
let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2

" increase limit for tag cache files
let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB


if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
