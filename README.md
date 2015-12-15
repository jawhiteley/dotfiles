Jonathan Whiteley
2012-12-10

Personal common configuration files ("dotfiles") that I use across multiple systems and platforms.
Platform-specific commands and settings are often kept in separate files.

# Installation

    install.sh

# Organization

* Files are grouped by the name of the program they are for.
* There is an example config file that usually starts with a reference (source or include) to a common personal file.
  - This example file (or multiple files or directories) can be *copied* to the appropriate location on the system
* common personal settings and files have standard names, without leading '.' and ending in '-dot'.
  - e.g., 'vimrc-dot'

I really do want to change this setup: it's confusing and unnecessarily complicated.


## Why is it like this?

Because I find there are almost always system-specific settings --- like font sizes, window sizes, or other ideosyncracies of a particular environment. 
I do not want to sync these across systems, but I do want common settings to be easily accessible and automatically updated across systems.
This way, I can keep all my common dotfiles in one place, managed in a git repository, while also allowing for system-specific settings.

# Reference

* [GitHub](https://github.com/)
* [GitHub Desktop](https://desktop.github.com)
* [My repos](https://github.com/jawhiteley/)

* [dotphiles](https://github.com/dotphiles/dotphiles)
  * [dotsync](https://github.com/dotphiles/dotsync)

# More Reading

* [GitHub does dotfiles](https://dotfiles.github.io)

