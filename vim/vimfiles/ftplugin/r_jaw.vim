" Custom options specific to R-syntax files
" .vim/ftplugin/r_jaw.vim
" Jonathan Whiteley 2011-10, 2020-04-01

" Vim-R-plugin custom key bindings 

" alternative to replacing '_' with '<-'?
let R_assignment_operator = ' <- '  " Define variable to store replacement string
let R_pipe_operator = ' %>% '       " Defined in the `magrittr` package, commonly used in tidyverse)
" Literal key remap (no variable) --- ALL {rhs} characters are inserted:
"inoremap -- <Space><lt>-<Space>
" Remap to an expression (variable value) in {rhs}:
inoremap <expr> -- R_assignment_operator
inoremap <expr> __ R_assignment_operator
inoremap <expr> <C-_> R_pipe_operator
inoremap <C-_><C-_> <Space>-><Space>
" Typing <C--> sends the same keycode as <C-_> to vim (no way to map <C--> separately, it seems)
"inoremap <expr> <C--> R_assignment_operator
" Emulate Rstudio behaviour
inoremap <expr> <M--> R_assignment_operator
inoremap <expr> <M--><M--> R_pipe_operator
if has('mac') 
  " on a Mac, Alt-* (Opt+*) often produces some other character.  
  "   Alt-- = – (n-dash)
  "   Alt-Shift-- = — (m-dash)
  " Remap – (en-dash) to Alt--, recusively so it triggers the <M--> behaviour defined above.
  "imap – <M-->
  "inoremap <D-–> –
  imap –– <M--><M-->
  " I don't actually like RStudio's default behaviour of remapping Alt--,
  " which prevents input of an en-dash in the editor.
  " Mind you, this is not a valid character in open code, so it would rarely be needed.
  " The point is that it interferes with usual Mac behaviour,
  " and is therefore not a 'typical' shortcut on a Mac.
  " Remapping Cmd+Opt+- to Opt+- (which is otherwise unreachable on a Mac)
  imap <D-–> <M-->
  " Remap Cmd+Opt+= to Assignment Operator? 
  " This is the shortcut to 'Zoom' window on Mac :(
  " Cmd+= is the shortcut to zoom text (increase text size).
  "inoremap <expr> <D-≠> R_assignment_operator
endif
" Not working: can't figure out how to map CTRL+= in vim :(
inoremap <expr> <C-=> R_assignment_operator

