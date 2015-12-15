Common configuration files for Vim >=7.4
(The Vim-R-plugin now requires Vim 7.4).

The vim folder in this folder can be *copied* directly to the `.vim` (or `vimfiles` on Windows) directory. It is currently set up to be Windows-friendly (without symlinking or anything else requiring admin privileges).

Copy the vimrc file to the appropriate location on your system (and rename to `.vimrc`, as appropriate). Edit it to point to this folder and it will source the rest from common files here.

Note that as of Vim 7.4, `.vimrc` can be *inside* .vim

# [vim-plug]

[vim-plug]: https://github.com/junegunn/vim-plug

A minimalist plugin manager for Vim. See the ReadMe file in /Plugins.
