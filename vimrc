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
" promtp if file wasn't saved before exit
set confirm
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2


colorscheme onedark

" max text length
au BufRead,BufNewFile *.rb setlocal textwidth=120

" get rid of trailing whitespace on :w
autocmd BufWritePre * %s/\s\+$//e

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
autocmd FileType javascript,typescript setlocal syntax=jsxpretty

au BufRead,BufNewFile *.jsx set filetype=javascriptreact
au BufRead,BufNewFile *.tsx set filetype=typescriptreact

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


call vundle#begin()
" Plugin 'preservim/nerdtree'
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

Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'jremmen/vim-ripgrep'

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
nnoremap <silent> <C-w> :wqa<CR>
imap <C-w> <Esc>:wqa<CR>


" Ripgrepp
let g:rg_highligh = 1
"" Quick comment toggling
Plugin 'tpope/vim-commentary'
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

" Files stucture tree
map <C-m> :NERDTreeToggle<CR>
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
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-projectionist'
" Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s
call plug#end()

" ALE
nnoremap <silent> <C-f> :ALEFix<CR>
imap <C-f> <Esc> :ALEFix<CR>i
" let Vundle manage Vundle, required
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:gutentags_enabled = 1

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
let g:ale_linters = {'ruby': ['rubocop', 'ruby'], 'javascript': ['javascript', 'eslint'], 'html': ['prettier', 'html'], 'css': ['stylelint', 'css']}
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ruby_indent_assignment_style = 'variable'

" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" double space for search by file name
let mapleader = "\<Space>"
nnoremap <silent> <Leader><Leader> :FZF<CR>

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

nmap <F2>n :call feedkeys(":NewFile " . expand('%@'))<CR>

" Define a custom command to open a new tab and prompt for a text to search
command! -nargs=1 LookUp call LookUp(<f-args>)

" Function to open a prompt for a search text
function! LookUp(text)
	let text = input('Search: ')
	if text != ''
		execute 'Rg ' . text
	endif
endfunction

nnoremap <F1>s :LookUp __lu<CR>

nnoremap <Tab> :tabnext<CR>

" Enable coc.nvim
let g:coc_global_extensions = ['coc-tsserver']

" Customize HTML tag highlighting
highlight HTMLTagDelimiter ctermfg=Blue guifg=Blue
highlight HTMLTagName ctermfg=Green guifg=Green


" Define a custom command to open a new tab and prompt for a text replace
command! -nargs=* Replace :call ReplaceAll(<q-args>)

" Function to open a prompt for replacing text
function! ReplaceAll(args)
	if a:args != ''
		let target = input('Replace: ')
		if target != ''
			let to = input('To: ')
			execute '%s/'. target . '/' . to . '/g'
		endif
	endif
endfunction

nnoremap <silent><F1>r :Replace __ __<CR>
imap <F1>r <Esc>:Replace __ __<CR>


command! -nargs=1 -complete=file -bang Rename {
		g:Rename(<q-args>, '<bang>')
	}

def g:Rename(name: string, bang: string): bool
	var oldfile = expand('%:p')
	var status: bool

	if bufexists(fnamemodify(name, ':p'))
		if (bang ==# '!')
			silent exe ':' .. bufnr(fnamemodify(name, ':p')) .. 'bwipe!'
		else
			echohl ErrorMsg
			echomsg 'A buffer with that name already exists (use ! to override).'
			echohl None
			return false
		endif
	endif

	status = true

	v:errmsg = ''
	silent! exe 'silent! saveas' .. bang .. ' ' .. name

	if v:errmsg =~# '^$\|^E329'
		var lastbufnr = bufnr('$')

		if expand('%:p') !=# oldfile && filewritable(expand('%:p'))
			if fnamemodify(bufname(lastbufnr), ':p') ==# oldfile
				silent exe ':' .. lastbufnr .. 'bwipe!'
			else
				echohl ErrorMsg
				echomsg 'Could not wipe out the old buffer for some reason.'
				echohl None
				status = false
			endif

			if delete(oldfile) != 0
				echohl ErrorMsg
				echomsg 'Could not delete the old file: ' .. oldfile
				echohl None
				status = false
			endif
		else
			echohl ErrorMsg
			echomsg 'Rename failed for some reason.'
			echohl None
			status = false
		endif
	else
		echoerr v:errmsg
		status = false
	endif
	execute ':NERDTreeRefresh'
	return status
enddef

nmap <F2>r :call feedkeys(":Rename " . expand('%@'))<CR>

nmap <F2>d :call feedkeys(":RemoveFile " . expand('%@'))<CR>
command! -nargs=* RemoveFile :call RemoveFile(<q-args>)

function! RemoveFile(file_to_remove)
    if filewritable(a:file_to_remove)
	let file = a:file_to_remove
        let choice = input('Are you sure you want to remove ' . file . '? (y/n): ')
        if choice =~# '^y'
            call delete(file)
	    execute ':NERDTreeRefresh'
            echo ' File removed: ' . file
        else
            echo ' File not removed.'
        endif
    else
        echo ' File does not exist or is not writable.'
    endif
endfunction


function! CreateDir(path)
  " Check if the directory exists
  if !isdirectory(a:path)
    " Create the directory and its parent directories recursively
    call mkdir(a:path, "p")
    execute ':NERDTreeRefresh'
    echo "Directory created: " . a:path
  else
    echo "Directory already exists: " . a:path
  endif
endfunction

nmap <F2>cd :call feedkeys(":CreateDir " . expand('%@'))<CR>
command! -nargs=* CreateDir :call CreateDir(<q-args>)

inoremap <C-A> <C-O>0
inoremap <C-E> <C-O>$

" Map Ctrl-F to automatically fix indentation in Ruby
autocmd FileType ruby inoremap <C-L> <Esc>:normal gg=G<C-O>A<CR>
