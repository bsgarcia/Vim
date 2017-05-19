

"----------[ VIM GENERAL CONFIG ]---------"

""change some commands
nnoremap a b
noremap e w
nnoremap cc dd
nnoremap dd "_dd 

"improve searching function 
set incsearch

"disable preview window
set completeopt=menu,menuone
set completeopt-=preview

"close window after completion
"let g:ycm_autoclose_preview_window_after_completion=1

" CDC = Change to Directory of Current file
command CDC cd %:p:h

" Go to tab by number
noremap ¦ 1gt
noremap é 2gt
noremap ¢ 3gt
noremap § 4gt

" cycle through vim using alt+arrows
noremap <M-Right> :tabn<CR>
noremap <M-Left>  :tabp<CR>

" create new tab current folder 
noremap <C-t> :CDC<CR> :tabe ./ <CR>

"exec pathogen plugin manager
execute pathogen#infect()

"enable completion function arguments
filetype plugin on

"jedi configuration (no conflicts with ycm)
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0"

"disable ycm
"let g:loaded_youcompleteme = 1

"Toggle lines by default
let g:indentLine_enabled = 0

""disable start up msg
set shortmess+=A

""enable mouse
set mouse=a

""set nowrap
set nowrap

"tab options
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line for new line

"" Launch YMC CORE with python2 interpreter
let g:ycm_server_python_interpreter = "/usr/bin/python"

"Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = []


""set colorscheme
colorscheme gruvbox
syntax on
filetype indent on

"set cursor
set so=7

"set background
set background=dark

""fix font airline 
if has("gui_running")
   set guifont=Terminus\ 12
endif
"remove gui
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"fix background 
set t_Co=256 


"set copy paste
inoremap <C-v> "+gP
"noremap <C-v> "+gP
noremap <C-c> "+y

"remove bell
set noerrorbells
set belloff=all

"set vim airline
set laststatus=2
let g:airline_powerline_fonts = 1
set linespace=0

"set edit end of line
nnoremap $ A

"set lines nb
set nu

"set nerdtree
map <C-n> :NERDTreeToggle<CR>

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
