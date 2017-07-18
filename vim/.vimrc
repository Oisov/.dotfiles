" Use space as leader key
map <space> <leader>
let mapleader = "\<space>"
"
 
" Source the vimrc file after saving it
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
 
call plug#begin('~/.vim/plugged')
 
Plug 'bling/vim-airline'  " Command line at the bottom
Plug 'chrisbra/colorizer' "h:Colorizer
Plug 'christoomey/vim-sort-motion' "Sort paragraphs etc gs
Plug 'christoomey/vim-system-copy' "Use cp to copy and cv to paste to the clipboard
Plug 'christoomey/vim-titlecase' "Titlecase words with gt
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "FAST Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align' "Use ga to allign
Plug 'lervag/vimtex'
Plug 'tibabit/vim-templates' "Add templates in ~/templates
Plug 'tpope/vim-commentary' " Comment out stuff with gc
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-sensible' " backslash to delete, etc
Plug 'tpope/vim-surround' " change surrounding parenthesis cs' or ys' for adding
Plug 'vim-scripts/ReplaceWithRegister' "gr[motion]
 
" Colorscheme plugins
 
Plug 'vim-airline/vim-airline-themes' "Themes for airline
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
 
call plug#end()
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
if &term == "screen"
  set t_Co=256
endif
 
set background=dark
" let g:solarized_termcolors=256 "this is what fixed it for me
" let g:solarized_termtrans = 1 "fixed the black bakground
let g:airline_solarized_bg='dark'
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'
colorscheme solarized
 
" Plugin specific features
augroup latexSurround
    autocmd!
    autocmd FileType tex call s:latexSurround()
augroup END
 
function! s:latexSurround()
    let b:surround_{char2nr("e")}
           \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
    let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction
 
command! -complete=custom,ListE -nargs=1 Ei execute "normal \<Esc>i\\begin{<args>}\<CR>\\end{<args>}<Esc>O<Space>" | startinsert
function! ListE(A,L,P)
  return "align*\nenumerate\nitemize\nfigure\ntabular\nbmatrix\npmatrix\ncases\n\ndocument\narray\nproof"
endfunction
 
set wildcharm=<C-z> "Enables <C-z> to use autocomplete in commands
 
inoremap EE <Esc>diw:Ei <C-R>"<C-z><CR>
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=r
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
 
 
 
" Disable some mappings
noremap  <f1>   <nop>
inoremap <f1>   <nop>
nnoremap Q      <nop>
 
" Some general/standard remappings
nnoremap Y      y$
nnoremap då     d$
nnoremap cå     c$
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <leader>w :update<cr>
inoremap jk <esc>
inoremap AA <C-o>A
inoremap II <C-o>I
inoremap CL <C-o>c$
inoremap CC <C-o>cc
set wildcharm=<C-z> "Enables <C-z> to use autocomplete in commands
 
" ==========================================
"      Plugins keybindings
" ==========================================
 
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
xmap gA <Plug>(EasyAlign)
 
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nmap gA <Plug>(EasyAlign)
 
 
nmap <C-b> :w<CR>:args /home/oistes/maal.md *.md \| argdo tabe <CR>:tabclose<CR>:tabp<CR>/OPPGAVENAVN.html<CR>:noh<CR>:put=expand('%:p:h')<CR>$T/hd00y$i..<Esc>$pA.html<Esc>ddk0f/gri(2gg<leader>f
 
nmap <leader>v :tabedit $MYVIMRC<CR> "Opens .vimrc
 
nmap <leader>m :tabedit /home/oistes/maal.md<CR>
 
" Gets the current file directory and capitalizes it
nmap <leader>f ititle<C-x><C-l><Esc>T:i Lærerveiledning -<Esc>0olevel<C-x><C-l><Esc>0olang<C-x><C-l><Esc>
 
" Inserts kompetansemål by tag
inoremap <C-f> <C-x><C-l><Esc> k0diw
 
" Pastes the path of the file twice
nnoremap <leader>n :let @" = expand('%:p:h:t')<CR>:%s/OPPGAVENAVN/\=@"/g<CR>
