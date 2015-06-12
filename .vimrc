" Default settings ----------{{{
augroup default_settings
	autocmd!
	autocmd BufNewFile,BufRead * set number
	autocmd BufNewFile,BufRead * set autoindent
	autocmd BufNewFile,BufRead * set smartindent
	autocmd BufNewFile,BufRead * set t_Co=256
	autocmd BufNewFile,BufRead * set ts=2
	autocmd BufNewFile,BufRead * set sw=2
	autocmd BufNewFile,BufRead * set ignorecase						" Case insensitive search 
	autocmd BufNewFile,BufRead * set hlsearch incsearch 	" Highlight search and the next possible match
	autocmd BufNewFile,BufRead * colorscheme molokai 
	autocmd BufNewFile,BufRead * highlight comment term=bold ctermfg=6
	
	autocmd BufNewFile,BufRead * set pastetoggle=<F2>
augroup END

augroup file_specific_settings
	autocmd!
	" Set nowrap when read new or existing files.
	autocmd BufNewFile,BufRead .vimrc setlocal nowrap
augroup END
" }}}

" Statusline ----------{{{
" General format: %-0{minwid}.{maxwid}{item} // only %, item is compulsory
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
augroup statusline_setup
	autocmd!
	autocmd BufNewFile,BufRead * set laststatus=2	" Always show statusline.
	autocmd BufNewFile,BufRead * set statusline=%<\ %n:%f\ %m%r%y%=%-30.(%l\ /\ %L,\ col:\ %c%V\ (%P)%)
augroup END
" }}}

" Folding ----------{{{
" ':help foldlevelstart'
augroup define_foldmethod
	autocmd!
	autocmd BufNewFile,BufRead * set foldlevelstart=0 	" every folds closed
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType ruby setlocal foldmethod=marker
augroup END
" }}}

" Abbreviations ----------{{{
" ':set iskeyword?' will show keyword characters and those are exempt from 
" possible abbreviation shortcut(usually underscore, letter and digit).
" See further descriptions on this format ':help isfname'
augroup basic_abbreviations
	autocmd!
	" Personal Info
	autocmd BufNewFile,BufRead * iabbrev jb Jeongbin
	autocmd BufNewFile,BufRead * iabbrev kjb Jeongbin Kim
	autocmd BufNewFile,BufRead * iabbrev @@ jeongbinkim@menumap.co.kr
	autocmd BufNewFile,BufRead * iabbrev mm MenuMap
	autocmd BufNewFile,BufRead * iabbrev lmm http://www.menumap.co.kr
	autocmd BufNewFile,BufRead * iabbrev smm http://menumap.co.kr

	" Handy Abbreviations
	autocmd FileType ruby iabbrev <buffer> iff if<CR><BS>end<Up>
	autocmd FileType ruby iabbrev <buffer> deff def<CR>end<Up>
augroup END
" }}}

" Operator-pending mappings ----------{{{
" <C-u> ':help omap-info'
" ':help pattern-overview', ':help expr-quote', ':help execute', ':help normal' for regexp.
augroup parentheses_operator
	autocmd!
	" Inside the next parentheses, curly brackets, gt&lt and quotes.
	autocmd BufNewFile,BufRead * onoremap in( :<C-u>normal! f(vi(<CR>
	autocmd BufNewFile,BufRead * onoremap in{ :<C-u>normal! f{vi{<CR>
	autocmd BufNewFile,BufRead * onoremap in< :<C-u>normal! f<vi<<CR>
	autocmd BufNewFile,BufRead * onoremap in" :<C-u>normal! f"vi"<CR>
	autocmd BufNewFile,BufRead * onoremap in' :<C-u>normal! f'vi'<CR>
	" Inside the previous(last) parentheses, curly brackets, gt&lt and quotes.
	autocmd BufNewFile,BufRead * onoremap il( :<C-u>normal! F)vi(<CR>
	autocmd BufNewFile,BufRead * onoremap il{ :<C-u>normal! F{vi{<CR>
	autocmd BufNewFile,BufRead * onoremap il< :<C-u>normal! F<vi<<CR>
	autocmd BufNewFile,BufRead * onoremap il" :<C-u>normal! F"vi"<CR>
	autocmd BufNewFile,BufRead * onoremap il' :<C-u>normal! F'vi'<CR>
	" Around the next parentheses, curly brackets, gt&lt and quotes.
	autocmd BufNewFile,BufRead * onoremap an( :<C-u>normal! f(va(<CR>
	autocmd BufNewFile,BufRead * onoremap an{ :<C-u>normal! f{va{<CR>
	autocmd BufNewFile,BufRead * onoremap an< :<C-u>normal! f<va<<CR>
	autocmd BufNewFile,BufRead * onoremap an" :<C-u>normal! f"va"<CR>
	autocmd BufNewFile,BufRead * onoremap an' :<C-u>normal! f'va'<CR>
	" Around the previous(last) parentheses, curly brackets, gt&lt and quotes.
	autocmd BufNewFile,BufRead * onoremap al( :<C-u>normal! F)va(<CR>
	autocmd BufNewFile,BufRead * onoremap al{ :<C-u>normal! F{va{<CR>
	autocmd BufNewFile,BufRead * onoremap al< :<C-u>normal! F<va<<CR>
	autocmd BufNewFile,BufRead * onoremap al" :<C-u>normal! F"va"<CR>
	autocmd BufNewFile,BufRead * onoremap al' :<C-u>normal! F'va'<CR>
augroup END
" }}}

" Key mappings ----------{{{
" ':help key-notation' to find keys.
" ':help mapleader', ':help maplocalleader'
" ':help autocmd-events' to get events.
" ':help autocmd-groups' for more information about autogroup
" ':help registers' to look for the registered values.
" ':help internal-variables' for variables' scope.
let mapleader = ","
let maplocalleader = "\\"

" Default functions.
augroup basic_functions
	autocmd!
	autocmd BufNewFile,BufRead * inoremap jk <Esc>
	autocmd BufNewFile,BufRead * inoremap <Esc> <nop> 
	autocmd BufNewFile,BufRead * nnoremap H ^
	autocmd BufNewFile,BufRead * nnoremap L $
	" Delete current line. 
	autocmd BufNewFile,BufRead * inoremap <leader><C-d> <Esc>ddi
	" Uppercase current word.
	autocmd BufNewFile,BufRead * inoremap <leader><C-u> <Esc>viwUea
	autocmd BufNewFile,BufRead * nnoremap <leader><C-u> viwU
	" Surround with quotes, double quotes.
	autocmd BufNewFile,BufRead * nnoremap <leader>" viw<Esc>a"<Esc>hbi"<Esc>lel
	autocmd BufNewFile,BufRead * nnoremap <leader>' viw<Esc>a'<Esc>hbi'<Esc>lel
	autocmd BufNewFile,BufRead * vnoremap <leader>" <Esc>`<i"<Esc>`>la"<Esc>
	autocmd BufNewFile,BufRead * vnoremap <leader>' <Esc>`<i'<Esc>`>la'<Esc>
augroup END

" .vimrc file // ':help myvimrc'
augroup myvimrc_specific_functions
	autocmd!
	" Open .vimrc
	autocmd BufNewFile,BufRead * nnoremap <leader>ev :split $MYVIMRC<CR>
	" Make effect .vimrc's changes on current file.
	autocmd BufNewFile,BufRead * nnoremap <leader>sv :source $MYVIMRC<CR>
augroup END

augroup comment_out
	autocmd!
	" Comment out one line.
	autocmd FileType vim	nnoremap <buffer> <localleader>c I"<Space><Esc>
	autocmd FileType ruby,sh nnoremap <buffer> <localleader>c I#<Space><Esc>
	autocmd FileType html,eruby nnoremap <buffer> <localleader>c I<!--<Space><Esc>A<Space>--><Esc>
	autocmd FileType css 	nnoremap <buffer> <localleader>c I/*<Space><Esc>A<Space>*/<Esc>
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<Space><Esc>
	" Comment out multiple lines.
	autocmd FileType vim 	vnoremap <buffer> <localleader>c <Esc>'<<C-v>'>I"<Space><Esc>
	autocmd FileType ruby vnoremap <buffer> <localleader>c <Esc>'<<C-v>'>I#<Space><Esc>
	autocmd FileType html,eruby vnoremap <buffer> <localleader>c <Esc>'<I<!--<CR><Esc>'>o--><Esc>
	autocmd FileType css,javascript	vnoremap <buffer> <localleader>c <Esc>'<I/*<CR><Esc>'>o*/<Esc>
	" Uncomment one line.
	autocmd FileType vim,ruby nnoremap <buffer> <localleader>uc I<Del><Del><Esc>
	autocmd FileType html,eruby nnoremap <buffer> <localleader>uc I<Del><Del><Del><Del><Del><Esc>A<BS><BS><BS><BS><Esc>
	autocmd FileType css 	nnoremap <buffer> <localleader>uc I<Del><Del><Del><Esc>A<BS><BS><BS><Esc>
	autocmd FileType javascript nnoremap <buffer> <localleader>uc I<Del><Del><Del><Esc>
	" Uncomment multiple lines.
	autocmd FileType vim,ruby vnoremap <buffer> <localleader>uc <Esc>'<<C-v>'>ld
	autocmd FileType html,eruby,css,javascript vnoremap <buffer> <localleader>uc <Esc>'<kdd'>jdd
augroup END
" }}}

" ':help :call', ':help return' 
" ':help E124' for function names
" ':help functions', ':help function-argument', ':help local-variable'
" ':help expr-quote', ':help i_CTRL-V', ':help literal-string'
" ':help execute'
" Regex ':help magic', ':help pattern-overview', ':help match'
