" Jonathan Whiteley     2015-12-14
" Settings specific to MS Windows
"  include at start of standard vimrc with:
"  source <sfile>:h/mswin.vim

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" On windows, the vim directory is `~/vimfiles` instead of `~/.vim`
" Set this as a variable to use in main vimrc?

" directory settings - to avoid file clutter from backup files
set backupdir=C:\Users\jwhiteley\AppData\Local\Temp
set backupskip=C:\Users\jwhiteley\AppData\Local\Temp
set directory=C:\Users\jwhiteley\AppData\Local\Temp
set undodir=C:\Users\jwhiteley\AppData\Local\Temp

" Windows function (from default vimrc, but I don't want the other stuff in there).
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

