"                                                                                                          
" ██╗   ██╗██╗███╗   ███╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗     ███████╗██╗██╗     ███████╗
" ██║   ██║██║████╗ ████║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝     ██╔════╝██║██║     ██╔════╝
" ██║   ██║██║██╔████╔██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗    █████╗  ██║██║     █████╗   
" ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║    ██╔══╝  ██║██║     ██╔══╝   
"  ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝    ██║     ██║███████╗███████╗ 
"  ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝     ╚═╝     ╚═╝╚══════╝╚══════╝




"exec pathogen plugin manager
execute pathogen#infect()

set wildmenu
set wildmode=list:longest,full

"" vim markdown math
let g:vim_markdown_math = 1

syntax on
" grep into git dir
nnoremap <space>g :ProjectRootExe grep<space>
nnoremap <silent> <C-n> :ProjectRootExe NERDTreeFind<cr>
nnoremap <C-f> :FZF<cr>

set ignorecase
" get column+line hightlight
set cursorline

" remove whitespaces 
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

""change some commands
"nnoremap a b
vnoremap <Tab> > 
noremap e w
nnoremap cc dd
nnoremap dd "_dd
nnoremap d  "_d
nnoremap x "_x

let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex'

"" automaticaly cd to current file
autocmd BufEnter * silent! lcd %:p:h

nnoremap <A-z> :Start! urxvtc -cd %:p:h <CR>
command Term :Start! urxvtc -cd %:p:h 

"set edit end of line
nnoremap $ A
"nnoremap ^ A
"
set path=$PWD/**

" tell it to use an undo file 
set undofile
" set a directory to store the undo history
set undodir=/home/getz/.vim/undo

"reduce keystrokes latency
set timeoutlen=1000 ttimeoutlen=0

"set latex suite
filetype plugin indent on
command Model :r ~/.tex_model.tex 
set grepprg=grep\ -nH\ $*
"let g:tex_flavor = 
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after


"use personal vim plugin (compilation GUI)                 
nnoremap <F2> :Start! python ~/python/tex/main.py %:p<CR>   

" Startify plugin
let g:startify_bookmarks =  [ { 'p': '~/python/'}, { 'v': '~/.vimrc' } , {'C': '~/python/HotellingServer' }, 
    \ {'l': '~/.config/awesome/rc.lua' }, {'t': '~/.config/awesome/themes/powerarrow-dark/theme.lua' },
    \ {'c' : '~/C/'}, {'w': '~/Web'}, {'P': '~/Pycharm'}, {'W': '~/Writings'}
    \ ]


" Syntastic speed up
let g:syntastic_enable_highlighting = 0
let g:syntastic_echo_current_error = 0

"improve searching function
set incsearch

"disable preview window
set completeopt=menu,menuone
set completeopt-=preview

" remove split separators
set fillchars+=vert:\ 

"close window after completion
"let g:ycm_autoclose_preview_window_after_completion=1

" commands
" CDC = Change to Directory of Current file
command CDC cd %:p:h
command Md ! md2pdf % && evince %:r.pdf &
command Wmd ! md2pdf % &


" Go to tab by number
noremap ¦ 1gt
noremap é 2gt
noremap ¢ 3gt
noremap § 4gt
noremap ¨ 5gt
noremap ­ 6gt
noremap è 7gt
noremap ß 8gt

" cycle through buffers in terminal using alt+arrows
noremap <A-Right> :bn<CR>
noremap <A-Left> :bp<CR>

" create new tab current folder
noremap <C-t> :CDC <CR> :tabe ./ <CR>

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

"disable ycm if file is tex
"let g:Tex_UsePython=0
"autocmd BufNewFile,BufRead *.tex let g:loaded_youcompleteme = 1

"Toggle lines by default
"let g:indentLine_enabled = 1
"let g:indentLine_char = '⋮'
""let g:indentLine_concealcursor=1
""let g:indentLine_setConceal = 1
"let g:indentLine_bgcolor_gui = '#282C34'

""disable start up msg
set shortmess+=A

""enable mouse
set mouse=a

""set nowrap
set nowrap

"set line break
set tw=80

"tab options
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line for new line

"" Launch YMC CORE with python3 interpreter
let g:ycm_server_python_interpreter = "/usr/bin/python"

"Syntastic options
nnoremap <F9> :SyntasticCheck<CR>
nnoremap <F10> :SyntasticReset<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w=0
let g:syntastic_check_on_write=0

let g:syntastic_cpp_compiler = ["g++"]


"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args='--disable=no-member --disable=line-too-long' .
            \ ' --disable=missing-docstring --disable=too-few-public-methods' . 
            \ ' --disable=invalid-name --disable=no-name-in-module' .
            \ ' --disable=bad-continuation --disable=too-many-instance-attributes' .
            \ ' --disable=too-many-public-methods --disable=broad-except'

let g:syntastic_python_flake8_args='--ignore=E501'
            "\ ' --disable=invalid-name --disable=no-name-in-module --disable=bad-continuation --disable=too-many-instance-attributes' .
            "\ ' --disable=too-many-public-methods --disable=broad-except'

filetype indent on
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

"set cursor
set so=7

"set colorscheme + background 
"colorscheme gruvbox
"set background=dark
"let g:airline_theme = 'one'

"--------------------- fix powerline by removing symbols ------------"
"
""fix font airline

if has("gui_running")
    set guifont=Consolas\ For\ Powerline\ 12
    colorscheme one
    set background=dark
    let g:airline_theme = 'one'
    set colorcolumn=90              " Show the 90th char colum
    highlight ColorColumn ctermbg=5
else
    "colorscheme gruvbox
    set t_Co=256
    colorscheme iceberg
    let g:airline_theme = 'iceberg'
    set background=dark
    hi Normal ctermbg=NONE
    highlight Cursor guifg=white guibg=black
    highlight iCursor guifg=white guibg=black
endif

" air-line
let g:airline_powerline_fonts = 1


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
if has("gui_running")
    " old vim-powerline symbols
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = ' ⭠ '
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
    "let g:airline_left_sep = ''
    "let g:airline_left_alt_sep = ''
    "let g:airline_right_sep = ''
    "let g:airline_right_alt_sep = ''
else
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif


"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"--------------------- if terminal session -------------------------


"remove gui
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"fix background
set t_Co=256

""set copy paste
"noremap <C-M-v> "+gP
"noremap <C-M-v> "*p
"noremap <C-M-c> "+y
"noremap <C-M-c> "*y
set clipboard=unnamedplus

"remove bell
set noerrorbells
set belloff=all

"set vim airline
set laststatus=2
let g:airline_powerline_fonts = 1
set linespace=0

"set lines nb
set nu

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" print all things in tex and json files
let g:vim_json_syntax_conceal = 0
let g:indentLine_setConceal = 0
set conceallevel=0

function! ProseMode()
  call goyo#execute(0, [])
  set noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  let g:ale_set_highlights = 0
  ALEToggle
  "set bg=light
endfunction

command! ProseMode call ProseMode()

set updatetime=100

let g:gitgutter_sign_added =  '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed = '┃'


let g:ale_sign_warning = '>>'

" If installed using git
set rtp+=~/.fzf
set guiheadroom=0

function MarkdownOptions()
    set autowrite
    ProseMode
    autocmd BufWritePost <buffer> silent! Wmd
    autocmd InsertLeave * write
    highlight EndOfBuffer guifg=bg guibg=bg
endfunction

autocmd BufNewFile,BufRead *.md call MarkdownOptions()
