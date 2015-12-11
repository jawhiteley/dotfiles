" Custom options specific to R-syntax files
" .vim/ftplugin/r_jaw.vim
" Jonathan Whiteley 2011-10

" Vim-R-plugin custom key bindings 

" alternative to replacing '_' with '<-'?
let g:RassignmentOperator = '<Space><lt>-<Space>'   " How do I refer to this in a keybinding?
inoremap <buffer> -- <Space><lt>-<Space>
inoremap <buffer> __ <Space><lt>-<Space>
inoremap <buffer> <C-_> <Space><lt>-<Space>
