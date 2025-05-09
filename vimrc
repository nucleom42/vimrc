set nocompatible              " be iMproved, required
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
set tags=tags
set hlsearch
set encoding=UTF-8
nnoremap <CR> :noh<CR>
nnoremap <silent> <C-]> :tab tag <C-r><C-w><CR>
" promtp if file wasn't saved before exit
set confirm
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

set title
autocmd BufEnter * let &titlestring = expand("%:t") | set title

" max text length
au BufRead,BufNewFile *.rb setlocal textwidth=120

au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" get rid of trailing whitespace on :w
autocmd BufWritePre * %s/\s\+$//e

" Enable automatic indentation for HTML and XML files
autocmd FileType html,xml setlocal shiftwidth=2 tabstop=2

" Enable automatic indentation for JavaScript and JSX files
autocmd FileType javascript,typescript,typescriptreact,javascriptreact,jsx,tsx setlocal expandtab shiftwidth=2 tabstop=2

" Enable automatic indentation for CSS and SCSS fies
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

let g:onedark_color_overrides = {"cursor_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}, "visual_grey": {"gui": "#63f542", "cterm": "155", "cterm16": "10"}}

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
" - To learn more about preview window options, see --preview-window section of man fzf.
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

let g:fzf_action = {'enter': 'tabedit',}

let g:LanguageClient_serverCommands = {
			\ 'ruby': ['/Users/osaltykov/.rvm/gems/ruby-3.3.6/bin/solargraph', 'stdio'],
			\ }

let python_highlight_all=1
call vundle#begin()
Plugin 'preservim/nerdtree'
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
" Plugin 'scrooloose/nerdtree'
Plugin 'jremmen/vim-ripgrep'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'

Plugin 'tpope/vim-commentary'
" Plugin 'Exafunction/codeium.vim'
Plugin 'github/copilot.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'DanBradbury/copilot-chat.vim'

call vundle#end()
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

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
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s
let mapleader = "\."
map - :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<cr>
" autocmd BufWinEnter * NERDTreeFind
map ] :NERDTreeFind<CR>
" open AI chats
nnoremap <leader>cp :CopilotChatOpen<CR>
nnoremap <leader>cc :Codeium Chat<CR>

" Ctrl-P configurations
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ctags with Ctrl-P
nnoremap <leader>p :CtrlPTag<cr>

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
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
" Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'
Plug 'andymass/vim-matchup'

call plug#end()

" ALE
nnoremap <silent> <leader>f :ALEFix<CR>
imap <leader>f :ALEFix<CR>i

nnoremap <silent><leader> q :below term zsh<CR>
imap <C-f> q :below term zsh<CR>i

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
			\  'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8'],
			\}
let g:ale_linters = {'ruby': ['rubocop', 'ruby'], 'python': ['flake8', 'pylint'], 'javascript': ['javascript', 'eslint'], 'html': ['prettier', 'html'], 'css': ['stylelint', 'css']}
let g:ale_ruby_rubocop_executable = 'rubocop'
let g:ruby_indent_assignment_style = 'variable'

" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" double space for search by file name

nnoremap <silent> <Space><Space> :FZF<CR>

let g:rubocop_command = 'rubocop'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

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

nnoremap <leader>cr :let @+=expand('%')<CR>:echo 'Relative path copied to clipboard'<CR>
" Define a custom command to open a new tab and prompt for a text to search
command! -nargs=1 LookUp call LookUp(<f-args>)

" Function to open a prompt for a search text
function! LookUp(text)
    " Prompt the user for the search text
    let text = input('Search: ')

    " Exit if the input is empty
    if text != ''
        " Escape special regex characters for Ripgrep
        let escaped_text = escape(text, '.\*[]^$(){}+?|\\')

        " Normalize newlines and whitespace to match any whitespace
        let normalized_text = substitute(escaped_text, '\n\+', '\\s*', 'g')
        let normalized_text = substitute(normalized_text, '\s\+', '\\s*', 'g')

        " Wrap the search term in single quotes to prevent shell interpretation issues
        let search_term = "'" . normalized_text . "'"

        " Construct the ripgrep command
        let command = "Rg -U --vimgrep --no-heading --column " . search_term . " --glob='!*tags*'"

        " Execute the ripgrep command and populate the Quickfix list
        cexpr system(command)

        " Open the Quickfix window if there are results
        if len(getqflist()) > 0
            copen
        else
            redraw " Clear previous input or text
            echo "No results found"
        endif
    endif
endfunction

nnoremap <silent> <leader>s :call LookUp('')<CR>

" Function to generate ctags depending on the project language
function! GenerateCTags()
		if filereadable('Gemfile')
    		" Ruby project
    		silent! !ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp --exclude=tags --node_modules
  	elseif filereadable('requirements.txt') || filereadable('pyproject.toml') || filereadable('setup.py')
    		" Python project
    silent! !ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(
						\ python3 -c "import os, sys; print(' '.join(d for d in sys.path if os.path.isdir(d)))"
						\ )
  	else
    		" Fallback
    		silent! !ctags -R --exclude=.git --exclude=log --exclude=tmp --exclude=tags --node_modules
		endif
endfunction

" Map <leader>ct to run GenerateCTags
nnoremap <leader>ct :call GenerateCTags()<CR>

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

nnoremap <leader>r :Replace __ __<CR>
imap <leader>r <Esc>:Replace __ __<CR>

inoremap <C-A> <C-O>0
inoremap <C-E> <C-O>$

autocmd FileType ruby inoremap <C-L> <Esc>:normal gg=G<C-O>A<CR>

nnoremap <silent><leader>2 :tabn<CR>
imap <C-f> 2 :tabn<CR>i
nnoremap <silent><leader> 1 :tabp<CR>
imap <C-f> 1 :tabp<CR>i
nnoremap <silent><leader>gb :Git blame<CR>
imap <leader>gb :Git blame <CR>i
nnoremap <silent><leader>gd :GitGutterDiffOrig<CR>
imap <leader>gd :GitGutterDiffOrig <CR>i

let s:salmon = "cc527a"
let s:greeny = "3aafa9"
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['rb'] = s:salmon
let g:NERDTreeExtensionHighlightColor['erb'] = s:salmon


highlight ColorColumnText cterm=underline ctermfg=none guifg=red guibg=NONE
call matchadd('ColorColumnText', '\%>120v.\+', 100)


