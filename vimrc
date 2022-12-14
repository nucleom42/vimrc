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
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

colorscheme onedark

" max text length
au BufRead,BufNewFile *.rb setlocal textwidth=120

" get rid of trailing whitespace on :w
autocmd BufWritePre * %s/\s\+$//e

"Pathogen
" set nocp
call pathogen#infect()
let NERDTreeShowHidden=1
set rtp+=~/.vim/bundle/Vundle.vim
" set ctrlP plugin
" set runtimepath^=~/.vim/bundle/ctrlp.vim
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

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" show git diif in vim
Plugin 'airblade/vim-gitgutter'
" plugin from http://vim-scripts.org/vim/scripts.html
" Install L9 and avoid a Naming conflict if you've already
" installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
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
" remap envoke key
nnoremap <silent> <C-z> :FZF<CR>
nnoremap <silent> <C-t> :Windows<CR>
nnoremap <silent> <C-c> :Buffers<CR>
nnoremap <silent> <C-x> :Rg<CR>
" remap close window
nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-w> :wq<CR>
" Ripgrep
Plugin 'jremmen/vim-ripgrep'
let g:rg_highligh = 1
Plugin 'valloric/youcompleteme'
"" Quick comment toggling
" Plugin 'tpope/vim-commentary'
" noremap \ :Commentary<CR
autocmd FileType ruby setlocal commentstring=#\ %s

" Files stucture tree
Plugin 'scrooloose/nerdtree'
" map <C-m> :NERDTreeToggle<CR>
map - :NERDTreeToggle<CR>
" map <leader>r :NERDTreeFind<cr>
" autocmd BufWinEnter * NERDTreeFind
map ] :NERDTreeFind<CR>

" Ctrl-P configurations
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" Ctags with Ctrl-P
" nnoremap <leader>. :CtrlPTag<cr>

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

" ALE
nnoremap <silent> <C-a> :ALEFix<CR>
Plugin 'dense-analysis/ale'
" call vundle#end()
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1

let g:ale_fixers = {
\  'ruby': [
\    'remove_trailing_lines',
\    'trim_whitespace',
\    'rubocop'
\  ]
\}
let g:ale_linters = {'ruby': ['rubocop', 'ruby']}
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ruby_indent_assignment_style = 'variable'

" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
set shell=/bin/zsh
