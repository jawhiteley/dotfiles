" Custom options specific to R-syntax files
" .vim/ftplugin/r_jaw.vim
" Jonathan Whiteley 2011-10, 2020-03-31

" Vim-R-plugin custom key bindings 

" alternative to replacing '_' with '<-'?
let R_assignment_operator = ' <- '   " Define variable to store replacement string
" Literal key remap (no variable) --- ALL {lhs} characters are inserted:
"inoremap -- <Space><lt>-<Space>
" Remap to an expression (variable value):
inoremap <expr> -- R_assignment_operator
inoremap <expr> __ R_assignment_operator
" Typing <C--> sends the same keycode as <C-_> to vim (no way to map <C--> separately, it seems)
inoremap <C-_> <Space>-><Space>
"inoremap <expr> <C--> R_assignment_operator
" Emulate Rstudio behaviour
inoremap <expr> <M--> R_assignment_operator
" on a Mac, Alt-* often produces some other character.  
"   Alt-- = – (n-dash)
"   Alt-Shift-- = — (m-dash)
if has('mac') 
  imap – <M-->
  inoremap <D-–> –
endif
" Not working: can't figure out how to map CTRL+= in vim :(
inoremap <expr> <C-=> R_assignment_operator
