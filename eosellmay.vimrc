" ============================================================================
" File:        eosellmay.vimrc
" Maintainer:  Eosellmay Li <yabo1887415157@qq.com>
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
"
" 个人配置 {{{
set nocompatible    " 关闭兼容模式
set encoding=UTF-8
set ts=4
set tabstop=4
set nowrap
set noexpandtab
set nu
set relativenumber
set softtabstop=4
set shiftwidth=4
set foldmethod=marker
set foldenable
set ai              " 自动缩进
set si              " 智能缩进
" language zh
set history=500  " vim记住的历史操作的数量，默认的是20
set autoread     " 当文件在外部被修改时，自动重新读取
set backspace=2  " 让回车能删东西
" let maplocalleader=';' " 修改<leader>
" }}}

" 插件 {{{

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-peekaboo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'rakr/vim-one'
Plug 'Raimondi/delimitMate'
" Plug 'tomasr/molokai'
" Plug 'ZSaberLv0/ZFVimIM'
" Plug 'ZSaberLv0/ZFVimJob'
" Plug 'ZSaberLv0/ZFVimIM_openapi'
Plug 'easymotion/vim-easymotion'
call plug#end()

packadd! matchit

" }}}

" 输入法 {{{
function! s:myLocalDb()
    let db = ZFVimIM_dbInit({
                \   'name' : '自然码',
                \ })
    call ZFVimIM_cloudRegister({
                \   'mode' : 'local',
                \   'dbId' : db['dbId'],
                \   'repoPath' : '/home/eosellmay/project/tool/imdb/converted/',
                \   'dbFile' : '/zrm.txt',
                \   'dbCountFile' : '/zrm.count.txt'
                \ })
endfunction
" if exists('*ZFVimIME_initFlag') && ZFVimIME_initFlag()
"     call s:myLocalDb()
" else
"     autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()
" endif
let g:ZFVimIM_keymap = 0
" nnoremap <expr><silent> <m-i> ZFVimIME_keymap_toggle_n()
" inoremap <expr><silent> <m-i> ZFVimIME_keymap_toggle_i()
" vnoremap <expr><silent> <m-i> ZFVimIME_keymap_toggle_v()
let g:ZFVimIM_symbolMap = {
            \   ' ' : [''],
            \   '`' : ['·'],
            \   '!' : ['！'],
            \   '$' : ['￥'],
            \   '^' : ['……'],
            \   '-' : [''],
            \   '_' : ['——'],
            \   '(' : ['（'],
            \   ')' : ['）'],
            \   '[' : ['【'],
            \   ']' : ['】'],
            \   '<' : ['《'],
            \   '>' : ['》'],
            \   '\' : ['、'],
            \   '/' : ['、'],
            \   ';' : ['；'],
            \   ':' : ['：'],
            \   ',' : ['，'],
            \   '.' : ['。'],
            \   '?' : ['？'],
            \   "'" : ['‘', '’'],
            \   '"' : ['“', '”'],
            \   '0' : [''],
            \   '1' : [''],
            \   '2' : [''],
            \   '3' : [''],
            \   '4' : [''],
            \   '5' : [''],
            \   '6' : [''],
            \   '7' : [''],
            \   '8' : [''],
            \   '9' : [''],
            \ }
" }}}

" EasyMotion {{{
" map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" <Leader>f{char} to move to {char}
map f <Plug>(easymotion-bd-fl)
map t <Plug>(easymotion-bd-tl)
" nmap f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap F <Plug>(easymotion-bd-f)
nmap T <Plug>(easymotion-bd-t)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <m-g> <Plug>(easymotion-bd-f2)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" }}}

" 风格 {{{
set t_Co=256
set cursorline
set guifont=monospace
syntax on       " 语法高亮
" set lines=35 columns=150

" colorscheme peachpuff
" colorscheme onehalfdark

if has("termguicolors")
	" set t_8b=[48;2;%lu;%lu;%lum
	" set t_8f=[38;2;%lu;%lu;%lum
	set termguicolors
endif

colorscheme one
set background=dark
highlight Normal ctermbg=NONE guibg=NONE


set listchars=tab:┆-,space:-
set list
"syntax match MyTabSpace /[	]/
"highlight MyTabSpace guifg=darkgrey ctermfg=black cterm=underline
"highlight link MyTabSpace Comment

" 光标所在的当前行高亮
set cursorline
" highlight CursorLine   cterm=NONE ctermbg=gray ctermfg=black guibg=NONE guifg=NONE
" highlight CocHighlightText cterm=NONE ctermbg=yellow ctermfg=black guibg=NONE guifg=NONE

" 总是显示状态栏
set laststatus=2
" highlight StatusLine cterm=bold ctermfg=black ctermbg=yellow

" Add status line support, for integration with other plugin, checkout `:h coc-status`
autocmd User CocStatusChange redrawstatus
" set statusline+=%{coc#status()} "	%{get(b:,'coc_current_function','')}
" 不显示当前模式
set noshowmode
let g:lightline = {
\	'active': {
\		'left': [
\			[ 'mode', 'paste' ],
\			[ 'readonly', 'filename', 'modified' ],
\			[ 'imstatus' ]
\		],
\		'right': [
\			[ 'fileencoding' ],
\			[ 'cocstatus' ],
\			[ 'lineinfo', 'percent' ]
\		]
\	},
\	'component_function': {
\		'cocstatus': 'coc#status',
\		'imstatus': 'ZFVimIME_IMEStatusline'
\	},
\}
" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update() " Using CocList

" highlight PMenu ctermfg=40 ctermbg=0
" highlight PMenuSel ctermfg=0 ctermbg=4
" let g:airline#extensions#tabline#enabled = 1
" Workaround for creating transparent bg
" "autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
" "				\ |    highlight LineNr     ctermbg=NONE guibg=NONE
" "				\ |    highlight SignColumn ctermbg=NONE guibg=NONE
" "

" 支持斜体
highlight Comment cterm=italic

" }}}

" 文件树 {{{

" NERD tree
" http://www.vim.org/scripts/script.php?script_id=1658
let NERDTreeShowHidden = 1
let NERDTreeWinPos = "left"
" nmap <localleader>n <C-u>:NERDTreeToggle<cr>
" nmap <localleader>m <C-u>:NERDTreeFocus<cr>
" 忽略一下文件的显示
let NERDTreeIgnore=['.\.pyc','.\~$','.\.swp','\.git$']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 显示行号
let NERDTreeShowLineNumbers=1

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "改",
    \ "Staged"    : "存",
    \ "Untracked" : "漏",
    \ "Renamed"   : "移",
    \ "Unmerged"  : "待",
    \ "Deleted"   : "删",
    \ "Dirty"     : "十",
    \ "Clean"     : "丨",
    \ "Unknown"   : "？"
    \ }
" 显示每一个未追踪文件夹中的文件
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'

let g:NERDTreeGitStatusShowClean = 1 " default: 0

" 镜像 ExploreTree {{{

command! -n=? -complete=dir -bar NERDTreeExploreMirror :call CreateExploreMirror('<args>')

function! CreateExploreMirror(dir)
    let creator = g:NERDTreeCreator.New()

    " from CreateExploreTree {
        if getbufinfo('%')[0].changed && !&hidden && !&autowriteall
            let l:splitLocation = g:NERDTreeWinPos ==# 'left' || g:NERDTreeWinPos ==# 'top' ? 'topleft ' : 'botright '
            let l:splitDirection = g:NERDTreeWinPos ==# 'left' || g:NERDTreeWinPos ==# 'right' ? 'vertical' : ''
            silent! execute l:splitLocation . l:splitDirection . ' new'
        else
            silent! execute 'enew'
        endif
    " }

    " from _createTreeWin {
        if !g:NERDTree.ExistsForTab()
            let t:NERDTreeBufName = creator._nextBufferName('tab')
            silent! execute 'edit ' . t:NERDTreeBufName
            " from createTabTree {
                let l:path = creator._pathForString(a:dir)

                " Abort if an exception was thrown (i.e., if the bookmark or directory
                " does not exist).
                if empty(l:path)
                    return
                endif

                " Obey the user's preferences for changing the working directory.
                if g:NERDTreeChDirMode != 0
                    call l:path.changeToDir()
                endif

                call creator._createNERDTree(l:path, 'window')

                call creator._broadcastInitEvent()
            " }
        else
            silent! execute 'buffer ' . t:NERDTreeBufName
        endif

        setlocal winfixwidth

        call creator._setCommonBufOptions()

        if has('patch-7.4.1925')
            clearjumps
        endif
    " }

    " from CreateExploreTree
    call b:NERDTree.render()

	" from UI.restoreScreenState {
		if has_key(b:NERDTree.ui, '_screenState')
			let old_scrolloff=&scrolloff
			let &scrolloff=0
			call cursor(b:NERDTree.ui._screenState['oldTopLine'], 0)
			normal! zt
			call setpos('.', b:NERDTree.ui._screenState['oldPos'])
			let &scrolloff=old_scrolloff
		endif
	" }
endfunction

" }}}

command! -nargs=? Q :NERDTree
noremap <silent><M-e> :<C-u>NERDTreeExploreMirror<cr>

" 打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|
" }}}

" 缓冲区探索器 {{{
" About Buffers Explorer （需要genutils.vim）
" http://vim.sourceforge.net/scripts/script.php?script_id=42
" http://www.vim.org/scripts/script.php?script_id=197
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
" let g:bufExplorerSplitVertSize = s:PlugWinSize  " Split width
" let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
nmap <silent> <localleader>bb :BufExplorer<CR>
" }}}

" 缩进显示 {{{

let g:indentLine_enabled = 0
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" }}}

" coc.nvim {{{

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

let g:coc_global_extensions = [
			\ 'coc-marketplace',
			\ 'coc-tsserver',
			\ 'coc-git',
			\ 'coc-json',
			\ 'coc-snippets',
			\ 'coc-html',
			\ 'coc-toml',
			\ 'coc-yaml',
			\ 'coc-rust-analyzer',
			\ 'coc-eslint',
			\ '@yaegassy/coc-intelephense',
			\ 'coc-css',
			\ 'coc-pyright',
			\ 'coc-clangd'
			\ ]

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <M-h> <Plug>(coc-diagnostic-prev)
nmap <silent> <M-l> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <localleader>gd <Plug>(coc-definition)
nmap <silent> <localleader>gt <Plug>(coc-type-definition)
nmap <silent> <localleader>gi <Plug>(coc-implementation)
nmap <silent> <localleader>gr <Plug>(coc-references)
nmap <silent> <localleader>rf <Plug>(coc-refactor)
" Remap for rename current word
nmap <localleader>rn <Plug>(coc-rename)
" Remap for do codeAction of current line
nmap <localleader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <localleader>fp  <Plug>(coc-fix-current)
" Git undo
nnoremap <localleader>ud  :<C-u>CocCommand git.chunkUndo<CR>
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
nnoremap <M-D> :<C-u>call CocAction('format')<cr>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
nnoremap <M-T> :<C-u>call CocAction('runCommand', 'editor.action.organizeImport')<cr>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" 没有鼠标的话如何悬停
nnoremap <silent> <space>h  :<C-u>call CocActionAsync('doHover')<cr>

" 可以滚动浮动窗口
noremap <nowait><expr> <M-j> coc#float#has_scroll() ? coc#float#scroll(1, 8) : "\<C-j>"
inoremap <nowait><expr> <M-j> coc#float#has_scroll() ? coc#float#scroll(1, 8) : "\<C-j>"
noremap <nowait><expr> <M-k> coc#float#has_scroll() ? coc#float#scroll(0, 8) : "\<C-k>"
inoremap <nowait><expr> <M-k> coc#float#has_scroll() ? coc#float#scroll(0, 8) : "\<C-k>"

" }}}

" 括号补全 {{{
au FileType markdown let b:delimitMate_nesting_quotes = ["```"]
" }}}

" 功能 {{{
" 搜索 git 中文件的内容
command -nargs=1 Sch noautocmd vimgrep /<args>/gj `git ls-files` | cw

" 设置括号自动补齐
" inoremap [ []<LEFT>
" inoremap { {}<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" inoremap < <><LEFT>
" inoremap ( ()<LEFT>
" inoremap ` ``<LEFT>

" alt+z 切换自动换行
noremap <silent><M-z> :<C-u>set wrap!<cr>
imap <silent><M-z> <C-o><M-z>

" 对称的东西
set mps+=<:>

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on  " 文件类型插件
filetype indent on
set autoindent
" autocmd BufEnter * :syntax sync fromstart

" 在文件名上按gf时，在新的tab中打开
" map gf :tabnew <cfile><cr>

" 用gn,p在buffer之间切换
nn gn :bn<cr>
nn gp :bp<cr>
nn gh :b1<cr>
nn gd :bd<cr>

" 修改配置后自动加载
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 跳转到包含指定 buffer 的窗口（参数可以是 buffer 名或编号）
function! GotoBufferWindow(buf)
    let l:bufnr = bufnr(a:buf)
    if l:bufnr == -1
        echo "Buffer not found: " . a:buf
        return
    endif
    " 遍历所有窗口
    for winnr in range(1, winnr('$'))
        if winbufnr(winnr) == l:bufnr
            execute winnr . 'wincmd w'
            return
        endif
    endfor
endfunction

" 按<M-q>打开终端
nnoremap <expr> <silent> <M-q> buflisted("!/bin/bash") ? ":<C-u>call term_sendkeys(bufnr(\"!/bin/bash\"), \"\<C-d>\")<cr>" : "<C-w>s<C-w>j:<C-u>ter ++curwin<cr><C-w>k10<C-w>+<C-w>j"

" 删除buffer时不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        new
    endif
    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=10
    elseif &ttimeoutlen > 50 || &ttimeoutlen <= 0
        set ttimeoutlen=50
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(26)
		call s:metacode(a:mode, nr2char(char2nr('a') + i))
        " call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
	for c in ['A','B','C','D','E','G','I','J','K','L','M','N','T','U','V','W','X','Y','Z']
		call s:metacode(a:mode, c)
	endfor
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    if a:mode != 0
        for c in [',','.','/',';','{', '}']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',','.','/',';','{', '}']
            call s:metacode(a:mode, c)
        endfor
    endif
	for c in ['?','-','_']
		call s:metacode(a:mode, c)
	endfor
endfunc

command! -nargs=0 -bang VimMetaInit call Terminal_MetaMode(<bang>0)

:VimMetaInit

" 一进 vim 没有文件就打开终端，并打开文件浏览器
autocmd VimEnter * if !argc() | call feedkeys("\<C-w>v\<M-e>20\<C-w>\<\<C-w>l\<M-q>\<C-w>k\<M-e>") | endif

" }}}

