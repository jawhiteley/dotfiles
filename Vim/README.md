Common configuration files for Vim >=7.4
(The Vim-R-plugin now requires Vim 7.4).

Note that as of Vim 7.4, `.vimrc` can be *inside* .vim`

# macOS / Linux

symlink `vimrc` in this folder to `~/.vimrc` and `vim` to `~/.vim`.
The `vimrc` file in the `vim` folder is for use on Windows.

# Windows

The vim folder in this folder can be *copied* directly to `vimfiles` in the user $HOME directory on Windows. It is currently set up to be Windows-friendly (without symlinking or anything else requiring admin privileges). 

The `vimrc` file in this folder is setup to be a local file that sources the general `vimrc` file and related files in this folder (the path may have to be adjusted in the local file on each machine.


# [vim-plug]

[vim-plug]: https://github.com/junegunn/vim-plug

A minimalist plugin manager for Vim. See the ReadMe file in /Plugins.

Commands to run on installation on a new system:

    PlugUpgrade     " upgrade vim-plug itself
    PlugInstall     " Install plugins


