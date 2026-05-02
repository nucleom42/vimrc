" set nocompatible              " be iMproved, required
set number
syntax enable
syntax on
filetype plugin indent on
filetype on
filetype indent on
filetype plugin on
set clipboard=unnamedplus
set clipboard^=unnamed
set mouse=a
set backspace=indent,eol,start
set laststatus=2
set tags=tags;/
set hlsearch
set encoding=UTF-8
set confirm
set title

autocmd BufEnter * let &titlestring = expand("%:t") | set title

call plug#begin('~/.vim/plugged')

" Core
Plug 'VundleVim/Vundle.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Ruby / Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Search
Plug 'jremmen/vim-ripgrep'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'

" Linting / Fixing
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'

" Comments
Plug 'tpope/vim-commentary'

" AI
Plug 'Exafunction/codeium.vim'
Plug 'DanBradbury/copilot-chat.vim'
" Plug 'github/copilot.vim'

" Theme
Plug 'joshdick/onedark.vim'

" JS / TS / JSX
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'

" CSS
Plug 'hail2u/vim-css3-syntax'

" HTML
Plug 'mattn/emmet-vim'

" Formatting
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Project
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Misc
Plug 'tmux-plugins/vim-tmux'
Plug 'andymass/vim-matchup'

" Command line
Plug 'gelguy/wilder.nvim'

call plug#end()

" ============================================================
" Colorscheme
" ============================================================
let g:onedark_color_overrides = {
      \ "cursor_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"},
      \ "visual_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}
      \ }
colorscheme onedark

" ============================================================
" Indentation by filetype
" ============================================================
autocmd FileType ruby                                    setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby                                   setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html,xml                                setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript,typescript,typescriptreact,javascriptreact,jsx,tsx setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType css,scss                                setlocal shiftwidth=2 tabstop=2
autocmd FileType json                                    setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml                                    setlocal shiftwidth=2 tabstop=2

au BufRead,BufNewFile *.rb  setlocal textwidth=120
au BufNewFile,BufRead *.py  setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
au BufRead,BufNewFile *.jsx set filetype=javascriptreact
au BufRead,BufNewFile *.tsx set filetype=typescriptreact

let python_highlight_all=1

" ============================================================
" NERDTree
" ============================================================
let NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let s:salmon = "cc527a"
let s:greeny = "3aafa9"
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['rb']  = s:salmon
let g:NERDTreeExtensionHighlightColor['erb'] = s:salmon

" ============================================================
" FZF
" ============================================================
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_action = {'enter': 'tabedit'}

let $FZF_DEFAULT_OPTS='--preview="bat --style=numbers --color=always --line-range :500 {}" --bind=change:preview-up'

let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" FZF Command Popup
function! FzfCommands()
  let l:commands = getcompletion('', 'command')
  let header_com = s:center('cmd', 40)
  call fzf#run({
        \ 'source': l:commands,
        \ 'sink': function('s:exec_command'),
        \ 'options': [
        \   '--prompt=❯  ',
        \   '--layout=reverse',
        \   '--info=hidden',
        \   '--no-preview',
        \   '--no-scrollbar',
        \   '--border=rounded',
        \   '--padding=0,4',
        \   '--margin=0,3',
        \   '--color=border:#FFFFFF,prompt:#808080,pointer:#63f542,hl:#63f542,hl+:#63f542,fg:#808080,fg+:#FFFFFF,separator:#808080,input:#808080,header:#cc8400',
        \   '--pointer=›',
        \   '--height=3',
        \   '--separator=─',
        \   '--header=' . header_com,
        \   '--header-first',
        \ ],
        \ 'window': {
        \   'width': 0.35,
        \   'height': 0.3,
        \   'yoffset': 0.5,
        \   'xoffset': 0.5,
        \   'border': 'rounded',
        \   'highlight': 'Normal',
        \ }
        \ })
endfunction

function! s:exec_command(cmd)
  execute a:cmd
endfunction

nnoremap <F10> :call FzfCommands()<CR>

" ============================================================
" ALE
" ============================================================
let g:ale_set_loclist = 1
let g:ale_ruby_rubocop_config_file = '.rubocop.yml'
let g:ale_ruby_rubocop_executable = 'rubocop'

let g:ale_fixers = {
      \ 'ruby':            ['remove_trailing_lines', 'trim_whitespace', 'rubocop'],
      \ 'javascript':      ['remove_trailing_lines', 'trim_whitespace', 'eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'javascriptreact': ['eslint', 'prettier'],
      \ 'typescript':      ['eslint', 'prettier'],
      \ 'html':            ['remove_trailing_lines', 'prettier', 'trim_whitespace'],
      \ 'css':             ['trim_whitespace', 'stylelint', 'remove_trailing_lines'],
      \ 'python':          ['remove_trailing_lines', 'trim_whitespace', 'autopep8'],
      \ }

let g:ale_linters = {
      \ 'ruby':       ['rubocop', 'ruby'],
      \ 'python':     ['flake8', 'pylint'],
      \ 'javascript': ['eslint'],
      \ 'html':       ['prettier', 'html'],
      \ 'css':        ['stylelint', 'css'],
      \ }

" ============================================================
" vim-ruby
" ============================================================
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style      = 'variable'
let g:ruby_indent_block_style          = 'do'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading    = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails             = 1
autocmd FileType ruby setlocal commentstring=#\ %s

" ============================================================
" Gutentags
" ============================================================
let g:gutentags_enabled = 1

" ============================================================
" Snipmate
" ============================================================
let g:snipMate = { 'snippet_version' : 1 }

" ============================================================
" Gitgutter
" ============================================================
let g:gitgutter_grep = ''
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ============================================================
" COC
" ============================================================
let g:coc_global_extensions = ['coc-tsserver']

" ============================================================
" Lightline
" ============================================================
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" ============================================================
" Ripgrep custom function
" ============================================================
augroup FixRgOverride
  autocmd!
  autocmd VimEnter * call SetupCustomRg()
augroup END

function! SetupCustomRg()
  silent! delcommand Rg
  command! -bang -nargs=* Rg call s:rg(<q-args>, <bang>0)
endfunction

function! s:rg(args, bang)
  let l:query      = empty(a:args) ? expand('<cword>') : a:args
  let l:qs_escaped = substitute(l:query, "'", "'\"'\"'", 'g')
  let l:rg_cmd     = 'rg --column --line-number --no-heading --color=always --smart-case ' . shellescape(l:query)
  " let l:perl_script = "perl -pe 's/\\Q" . l:qs_escaped . "\\E/\\e[43m\$&\\e[0m/gi'"
      let l:words = split(l:query)
      let l:pattern = join(map(l:words, '"\\Q" . v:val . "\\E"'), '|')
      let l:perl_script = "perl -pe 's/" . l:pattern . "/\\e[43m\$&\\e[0m/gi'"
  let l:raw_preview = 'bat --style=numbers --color=always {1} | ' . l:perl_script
  let l:preview_cmd = 'bash -c ' . shellescape(l:raw_preview)
  let l:opts = '--ansi ' .
        \ '--preview ' . shellescape(l:preview_cmd) .
        \ ' --preview-window=down:50%:wrap ' .
        \ '--layout=reverse' .
        \ ' --bind=up:up,down:down,change:preview-up'
  let l:win = {
        \ 'width': 0.95, 'height': 0.90,
        \ 'border': 'rounded', 'highlight': 'Normal'
        \ }
  call fzf#vim#grep(l:rg_cmd, 1, {'options': l:opts, 'window': l:win}, a:bang)
endfunction

let g:rg_highligh = 1

" ============================================================
" Custom functions
" ============================================================

" Generate ctags based on project language
function! GenerateCTags()
  if filereadable('Gemfile')
    silent! !ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp --exclude=tags --node_modules
  elseif filereadable('requirements.txt') || filereadable('pyproject.toml') || filereadable('setup.py')
    silent! !ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(
          \ python3 -c "import os, sys; print(' '.join(d for d in sys.path if os.path.isdir(d)))"
          \ )
  else
    silent! !ctags -R --exclude=.git --exclude=log --exclude=tmp --exclude=tags --node_modules
  endif
endfunction

" New file in a new tab
command! -nargs=1 NewFile call NewFile(<f-args>)
function! NewFile(filename)
  let name = a:filename
  echo name
  if name != ''
    execute 'tabnew ' . name
    execute ':wq'
    execute ':NERDTreeRefresh'
  endif
endfunction

" Search via ripgrep with prompt
function! LookUp(text)
  let header = s:center('search', 40)

  call fzf#run({
        \ 'source': [],
        \ 'sink': function('s:lookup_sink'),
        \ 'options': [
        \   '--prompt=❯  ',
        \   '--layout=reverse',
        \   '--info=hidden',
        \   '--no-preview',
        \   '--no-scrollbar',
        \   '--border=rounded',
        \   '--padding=0,4',
        \   '--margin=0,2',
        \   '--color=border:#FFFFFF,prompt:#808080,pointer:#63f542,hl:#63f542,hl+:#63f542,fg:#808080,fg+:#FFFFFF,separator:#808080,header:#cc8400,',
        \   '--pointer=›',
        \   '--height=3',
        \   '--separator=─',
        \   '--print-query',
        \   '--no-select-1',
        \   '--no-exit-0',
        \   '--header=' . header,
        \   '--header-first',
        \ ],
        \ 'window': {
        \   'width': 0.4,
        \   'height': 0.10,
        \   'yoffset': 0.5,
        \   'xoffset': 0.5,
        \   'border': 'rounded',
        \   'highlight': 'Normal',
        \ }
        \ })
endfunction

function! s:center(text, width)
  let padding = repeat(' ', max([0, (a:width - len(a:text)) / 2]))
  return padding . a:text
endfunction

function! s:lookup_sink(lines)
  if type(a:lines) == type([])
    let l:text = a:lines[0]
  else
    let l:text = a:lines
  endif
  if empty(l:text)
    return
  endif
  call s:rg(l:text, 0)
endfunction

" Find and replace across buffer
command! -nargs=* Replace :call ReplaceAll(<q-args>)
function! ReplaceAll(args)
  if a:args != ''
    let target = input('Replace: ')
    if target != ''
      let to = input('To: ')
      execute '%s/' . target . '/' . to . '/g'
    endif
  endif
endfunction

" ============================================================
" HTML highlighting
" ============================================================
highlight HTMLTagDelimiter ctermfg=Blue guifg=Blue
highlight HTMLTagName ctermfg=Green guifg=Green

" ============================================================
" Long line highlight (>120 chars for Ruby)
" ============================================================
highlight ColorColumnText cterm=underline ctermfg=none guifg=red guibg=NONE
call matchadd('ColorColumnText', '\%>120v.\+', 100)

" ============================================================
" Key bindings
" ============================================================

" Clear search highlight on Enter
nnoremap <CR> :noh<CR>

" FZF
nnoremap <silent> <C-z>       :FZF<CR>
nnoremap <silent> <C-t>       :Windows<CR>
nnoremap <silent> <C-c>       :Buffers<CR>
nnoremap <silent> <C-x>       :Rg<CR>
nnoremap <silent> <Space><Space> :FZF<CR>

" Save / Quit
nnoremap <silent> <C-q> :q<CR>
imap     <C-q>          <Esc>:q<CR>
nnoremap <silent> <C-s> :w<CR>
imap     <C-s>          <Esc>:w<CR>i

" NERDTree
map - :NERDTreeToggle<CR>

" Leader key
let mapleader = "."

map <leader>nf :NERDTreeFind<cr>

" AI
nnoremap <leader>cp :CopilotChatOpen<CR>
nnoremap <leader>cc :Codeium Chat<CR>
nnoremap <leader>ce :Codeium Enable<CR>
nnoremap <leader>cd :Codeium Disable<CR>

" Navigation
nnoremap <leader><Up>   4k
nnoremap <leader><Down> 4j

" Window management
nnoremap <leader>wh  :split<CR>
nnoremap <leader>wv  :vsplit<CR>
nnoremap <leader>w'  :resize +5<CR>
nnoremap <leader>w/  :resize -5<CR>
nnoremap <leader>w]  :vertical resize +5<CR>
nnoremap <leader>w[  :vertical resize -5<CR>

" ALE
nnoremap <silent> <leader>f :ALEFix<CR>
imap     <leader>f          :ALEFix<CR>i

" Tags
nnoremap <leader>gt :call GenerateCTags()<CR>

" Git
nnoremap <silent> <leader>gb :Git blame<CR>
imap     <leader>gb           :Git blame<CR>i
nnoremap <silent> <leader>gd :GitGutterDiffOrig<CR>
imap     <leader>gd           :GitGutterDiffOrig<CR>i

" Tab navigation
nnoremap <leader><Left> :tabp<CR>
nnoremap <leader><Right> :tabn<CR>

" Copy relative path to clipboard
nnoremap <leader>cr :let @+=expand('%')<CR>:echo 'Relative path copied to clipboard'<CR>

" Search / Replace
nnoremap <leader>rr  :Replace __ __<CR>
imap     <leader>rr  <Esc>:Replace __ __<CR>
nnoremap <silent> <leader>ss :call LookUp('')<CR>

" Comments
noremap \ :Commentary<CR>

" Ruby auto-indent buffer
autocmd FileType ruby inoremap <C-L> <Esc>:normal gg=G<C-O>A<CR>

" Line start/end in insert mode
inoremap <C-A> <C-O>0
inoremap <C-E> <C-O>$

" Autocomplete: Tab / Enter to confirm
inoremap <expr> <Tab>   pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<Enter>"

" Wilder floating popup for command line
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'min_width': '100%',
      \ 'max_height': '25%',
      \ 'reverse': 0,
      \ }))

" Goto
nnoremap <leader>] <C-]>
nnoremap <leader>[ <C-t>

" ============================================================
" Custom Welcome Screen (Minimalist Menu)
" ============================================================

function! StartScreenMenu()
  let menu_title = 'menu'    
  let vim_version = 'Vim ' . (v:version / 100) . '.' . (v:version % 100)

  let orange = "\e[38;5;172m"
  let grey   = "\e[38;5;244m"
  let reset  = "\e[0m"

  let line2 = '          ' . orange . menu_title . reset
  let line1 = '            ' . grey . vim_version . reset
  let full_header = line1 . "\n" . line2
  
  let items = [
        \ 'Nerd Tree',
        \ 'Text search', 
        \ 'File search', 
        \ 'Update Plugins', 
        \ 'Quit'
        \ ]

  call fzf#run({
        \ 'source': items,
        \ 'sink': function('s:start_screen_sink'),
        \ 'options': [
        \   '--prompt=❯ ',
        \   '--layout=reverse',
        \   '--info=hidden',
        \   '--no-preview',
        \   '--no-scrollbar',
        \   '--border=rounded',
        \   '--padding=0,4',
        \   '--color=border:#FFFFFF,prompt:#808080,pointer:#63f542,hl:#63f542,hl+:#63f542,fg:#808080,fg+:#FFFFFF,separator:#808080,input:#808080,header:#cc8400',
        \   '--pointer=›',
        \   '--separator=─',
        \   '--header=          ' . full_header,
        \   '--header-first',
        \ ],
        \ 'window': {
        \   'width': 0.25,
        \   'height': 0.26,
        \   'yoffset': 0.5,
        \   'xoffset': 0.5,
        \   'border': 'rounded',
        \   'highlight': 'Normal',
        \ }
        \ })
endfunction

function! s:start_screen_sink(choice)
  if a:choice ==# 'Text search'
    call timer_start(50, { _ -> execute('call LookUp("")') })
  elseif a:choice ==# 'Nerd Tree'
    call timer_start(50, { _ -> execute('NERDTree') })
  elseif a:choice ==# 'File search'
    call timer_start(50, { _ -> execute('FZF') })
  elseif a:choice ==# 'Update Plugins'
    call timer_start(50, { _ -> execute('PlugUpdate') })
  elseif a:choice ==# 'Quit'
    call timer_start(50, { _ -> execute('qa') })
  endif
endfunction

function! s:open_menu_and_clean_ui(...)
  if mode() == 'c' | return | endif " Don't interrupt if user is typing a command
  
  set showtabline=0
  set laststatus=0
  if exists('+winbar')
    setlocal winbar=
  endif
  
  redraw!
  call StartScreenMenu()
  
  if has('nvim')
    feedkeys("\<Ignore>", "t")
  else
    call feedkeys("i", "t")
  endif
endfunction

function! StartScreen()
  if argc() != 0 || exists('s:start_screen_shown') | return | endif
  let s:start_screen_shown = 1

  enew
  silent! %delete _
  setlocal buftype=nofile bufhidden=wipe noswapfile
  setlocal nonumber norelativenumber nocursorline nolist signcolumn=no foldcolumn=0 colorcolumn=
  setlocal fillchars=eob:\ 

  nnoremap <buffer><silent> m :call StartScreenMenu()<CR>

  let s:old_showtabline = &showtabline
  let s:old_laststatus = &laststatus
  augroup StartScreenCleanup
    autocmd! * <buffer>
    autocmd BufLeave <buffer> let &showtabline = s:old_showtabline | let &laststatus = s:old_laststatus
  augroup END

  call timer_start(50, function('s:open_menu_and_clean_ui'))
endfunction

" Use a safer autocmd trigger
augroup StartScreenGroup
  autocmd!
  autocmd VimEnter * if argc() == 0 | call StartScreen() | endif
augroup END

" Global shortcut to open the Custom Welcome Menu
nnoremap <leader>m :call StartScreenMenu()<CR>
