" useful resource: https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Set line numbers to be relative to current line
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" set colour palette of VIM editor
colorscheme slate

" reload file if is detected to have changed externally
set autoread

" Define key-mappings (shortcuts)
map <Space> <Leader>
nnoremap <leader>bn :bnext<cr>| " go to next file in buffer
nnoremap <leader>bp :bprevious<cr>| " go to previous file in buffer
nnoremap <leader>b3 :b#<cr>| " go to last opened file in buffer
noremap <leader>cp I#<space><esc>0| " comment python line
noremap <leader>cpp :s/^\s*#\s\{0,1}//g<cr>| " uncomment python line
noremap <leader>ch I<!--<space><esc>A<space>--><esc>0| " comment html line
nnoremap <leader>fp :w<cr>:!python -m black %<cr>| " auto-format current python script (with black)
nnoremap <leader>lp :!clear<cr>:!echo "---MYPY---"<cr>:!mypy --ignore-missing-imports %<cr>:!echo "---PYLINT---"<cr>:!pylint %<cr>:!echo "---FLAKE8---"<cr>:!flake8 %<cr>| " python static code analysis 
nnoremap <leader>lpp :!clear<cr>:!pylint --disable=R,C %<cr>| " basic python static code analysis (warnings and errors only)
nnoremap <leader>mc I```<cr><cr>```<Up><Up>| " Make a markdown code block
nnoremap <leader>fj :w<cr>:!npx prettier --write %<cr>| " auto-format current javascript file (with prettier)  
nnoremap <leader>fws :%s/\s\+$//ge<cr>| " Delete all trailing whitespaces in document 

" Define custom commands
" python boilerplate code
:command InitPythonLogger normal! 0i# set up python logger #<cr>logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")<cr>logger = logging.getLogger(__name__)<Esc><cr>
:command InitPythonMultiCore normal! 0i# Run function my_function on multiple cores #<cr>import concurrent.futures<cr>from typing import Iterator<cr>with concurrent.futures.ProcessPoolExecutor() as executor:<cr>result: Iterator = executor.map(my_function, tuple_containing_input_for_each_function_call)<cr># e.g. executor.map(sum, ((60,9), (100,300,20)))<Esc><cr>
:command InitPythonMultiThread normal! 0i# Run function my_function on multiple threads #<cr>import concurrent.futures<cr>from typing import Iterator<cr>with concurrent.futures.ThreadPoolExecutor() as executor:<cr>result: Iterator = executor.map(my_function, tuple_containing_input_for_each_function_call)<cr># e.g. executor.map(sum, ((60,9), (100,300,20)))<Esc><cr>
:command InitPythonArgparse normal! 0i# python my_script_name.py abc def --debug --filename temp.html -n 69<cr>import argparse<cr>parser = argparse.ArgumentParser()<cr>parser.add_argument(dest="arg1") # script will raise an error if this argument is not supplied<cr>parser.add_argument(dest="arg2") # script will raise an error if this argument is not supplied<cr>parser.add_argument(<cr># an optional boolean flag<cr>"-d",<cr>"--debug",<cr>help="save intermediate process outputs to disk, for debugging purposes (do not use in production)",<cr>action="store_true", # if user doesn't provide this flag, give it the value False<cr>)<cr>parser.add_argument(<cr># a string constant <cr>"-f",<cr>"--filename",<cr>help="name of file to process",<cr># action="store", "store" is the default value (i.e. just save the value)<cr>required=True, # this command line argument is required. The default value for is False<cr>)<cr>parser.add_argument(<cr>"-s",<cr>"--style",<cr>help="style to apply to visual process output",<cr>default="plain",<cr>choices=["plain","elegant","dark"]<cr>)<cr>parser.add_argument(<cr>"-n",<cr>"--sample_size",<cr>help="size of random sample",<cr>type=int, # convert user input into an integer<cr>)<cr>args = parser.parse_args()<cr>print( "args.arg1", args.arg1 )<cr>print( "args.arg2", args.arg2 )<cr>print( "args.debug", args.debug )<cr>print( "args.filename", args.filename )<cr>print( "args.style", args.style )<cr>print( "args.sample_size", args.sample_size )<cr>
:command InitPythonGoogleDocstring normal! a<cr>"""Example google-style docstring<cr><cr>Args:<cr>param1 (int): The first parameter.<cr>param2 (int): The second parameter.<cr>param3 (str): The third parameter.<cr><cr><C-h>Returns:<cr>    bool: True if successful, False otherwise.<cr><cr><C-h>Raises:<cr>    ValueError: If `param2` is equal to `param1`.<cr><cr><C-H>Examples:<cr>    Examples should be written in doctest format, and should illustrate how<cr>to use the function.<cr><cr>>>> this_function(param1=69, param2=420, param3="test")<cr>[0, 1, 2, 3]<cr><C-h><C-h>"""<Esc><cr>









