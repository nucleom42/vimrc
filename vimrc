set nocompatible              " be iMproved, required
set number
syntax enable
set shell=bash
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
set tags=tags
set hlsearch
nnoremap <CR> :noh<CR>
" promtp if file wasn't saved before exit
set confirm
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" set shell=zsh

" max text length
au BufRead,BufNewFile *.rb setlocal textwidth=120

au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" get rid of trailing whitespace on :w
autocmd BufWritePre * %s/\s\+$//e
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" client side

" Enable automatic indentation for HTML and XML files
autocmd FileType html,xml setlocal shiftwidth=2 tabstop=2

" Enable automatic indentation for JavaScript and JSX files
autocmd FileType javascript,*.jsx,*.tsx,typescriptreact,javascriptreact setlocal expandtab shiftwidth=2 tabstop=2

" Enable automatic indentation for CSS and SCSS files
autocmd FileType css,scss setlocal shiftwidth=2 tabstop=2

" Enable automatic indentation for JSON files
autocmd FileType json setlocal shiftwidth=2 tabstop=2

" Enable automatic indentation for YAML files
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" Use Prettier for automatic code formatting (you need to have Prettier installed)
autocmd FileType javascript,jsx,tsx,html,css,scss autocmd BufWritePre <buffer> :silent! %!prettier --stdin-filepath=% --write

" Set vim-jsx-pretty as the syntax highlighter for JSX/React

au BufRead,BufNewFile *.jsx set filetype=javascriptreact
au BufRead,BufNewFile *.tsx set filetype=typescriptreact


let g:onedark_color_overrides = {"cursor_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}, "visual_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}, "search_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}, "replace_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}, "line_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}}

colorscheme onedark
"Pathogen
" set nocp
call pathogen#infect()
let NERDTreeShowHidden=1
set rtp+=~/.vim/bundle/Vundle.vim
let g:deoplete#enable_at_startup = 1
" set ctrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
" allow vim to jump through directories for ctags
set tags=tags;/
let g:snipMate = { 'snippet_version' : 1 }
let g:solarized_termcolors = 16
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:LanguageClient_serverCommands = {
			\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
			\ }

let python_highlight_all=1

call vundle#begin()
" Plugin 'preservim/nerdtree'
Plugin 'VundleVim/Vundle.vim'
" show git diif in vim
Plugin 'airblade/vim-gitgutter'

Bundle 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Fzg plugin
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-rooter'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'jremmen/vim-ripgrep'

Plugin 'vim-scripts/indentpython.vim'

" remap envoke key
nnoremap <silent> <C-z> :FZF<CR>
nnoremap <silent> <C-t> :Windows<CR>
nnoremap <silent> <C-c> :Buffers<CR>
nnoremap <silent> <C-x> :Rg<CR>
" remap close window
nnoremap <silent> <C-q> :q<CR>
imap <C-q> <Esc>:q<CR>
nnoremap <silent> <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i


" Ripgrepp
let g:rg_highligh = 1
"" Quick comment toggling
Plugin 'tpope/vim-commentary'
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

map - :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
" autocmd BufWinEnter * NERDTreeFind
map ] :NERDTreeFind<CR>

" Ctrl-P configurations
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ctags with Ctrl-P
nnoremap <leader>. :CtrlPTag<cr>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
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

call vundle#end()

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-projectionist'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
" Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s
call plug#end()

" ALE
nnoremap <silent> <C-f> :ALEFix<CR>
imap <C-f> <Esc> :ALEFix<CR>i

nnoremap <silent> <Tab>q :below term zsh<CR>
imap <C-f> <Tab>q :below term zsh<CR>i
" let Vundle manage Vundle, required
let g:ale_lint_on_text_changed = 1
" let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:gutentags_enabled = 1
let g:ale_ruby_rubocop_config_file = '.rubocop.yml'
let g:ale_fixers = {
			\  'ruby': [
			\    'remove_trailing_lines',
			\    'trim_whitespace',
			\    'rubocop'
			\  ],
			\  'javascript': [
			\    'remove_trailing_lines',
			\    'trim_whitespace',
			\    'eslint'
			\  ],
			\  'javascript.jsx': ['eslint'],
			\  'typescript.tsx': ['eslint'],
			\  'typescript': ['eslint'],
			\  'html': [
			\    'remove_trailing_lines',
			\    'prettier',
			\    'trim_whitespace'
			\  ],
			\  'css': [
			\    'trim_whitespace',
			\    'stylelint',
			\    'remove_trailing_lines'
			\  ],
			\
			\}
let g:ale_linters = {'ruby': ['rubocop', 'ruby'], 'python': ['flake8', 'pylint'], 'javascript': ['javascript', 'eslint'], 'html': ['prettier', 'html'], 'css': ['stylelint', 'css']}
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ruby_indent_assignment_style = 'variable'

" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" double space for search by file name
let mapleader = "\<Space>"
nnoremap <silent> <Space><Space> :FZF<CR>

let g:rubocop_command = 'rubocop'

" Remap Tab key to select first autocompletion suggestion
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<Enter>"
" Define a custom command to open a new tab and prompt for a file name
command! -nargs=1 NewFile call NewFile(<f-args>)
" Function to open a new tab and prompt for a file name
function! NewFile(filename)
	let name = a:filename
	echo name
	if name != ''
		execute 'tabnew ' . name
		execute ':wq'
		execute ':NERDTreeRefresh'
	endif
endfunction

nnoremap <silent> cr :let @+=expand('%:p:h')<CR>:echo 'Relative path copied to clipboard'<CR>
" Define a custom command to open a new tab and prompt for a text to search
command! -nargs=1 LookUp call LookUp(<f-args>)

" Function to open a prompt for a search text
function! LookUp(text)
	let text = input('Search: ')
	if text != ''
		let escaped_text = escape(text, '.\*[]^$(){}+?|')
		execute 'Rg "' . escaped_text . '" --glob=!*tags*'
	endif

endfunction

noremap <Tab>s :LookUp __lu<CR>

" nnoremap <Tab> :tabnext<CR>

" Enable coc.nvim
let g:coc_global_extensions = ['coc-tsserver']

" Customize HTML tag highlighting
highlight HTMLTagDelimiter ctermfg=Blue guifg=Blue
highlight HTMLTagName ctermfg=Green guifg=Green


" Define a custom command to open a new tab and prompt for a text replace
command! -nargs=* Replace :call ReplaceAll(<q-args>)

" Function to open a prompt for /replacing text
function! ReplaceAll(args)
	if a:args != ''
		let target = input('Replace: ')
		if target != ''
			let to = input('To: ')
			execute '%s/'. target . '/' . to . '/g'
		endif
	endif
endfunction

nnoremap <silent><Tab>r :Replace __ __<CR>
imap <Tab>r <Esc>:Replace __ __<CR>

inoremap <C-A> <C-O>0
inoremap <C-E> <C-O>$

autocmd FileType ruby inoremap <C-L> <Esc>:normal gg=G<C-O>A<CR>

nnoremap <silent> <Tab>2 :tabn<CR>
imap <C-f> <Tab>2 :tabn<CR>i
nnoremap <silent> <Tab>1 :tabp<CR>
imap <C-f> <Tab>1 :tabp<CR>i

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}
