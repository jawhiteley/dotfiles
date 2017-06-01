Jonathan Whiteley
2017-05-31

Personal common configuration files ("dotfiles") that I use across multiple systems and platforms.

I mostly use OS X (macOS) and Linux at home, and Windows (enterprise) at work. I wanted a solution that was functional on all. In the end, I settled for more automatic scripting for macOS, but with extra local files for manual installation on Windows.

# Installation

`cd` to this directory on the local system.

    ./install.sh

Setup / bootstrap / deploy / initialize a new system:
    
    ./_deploy/osx/brew.sh
    ./_deploy/osx/osx.sh

# Organization

* Files are grouped by the name of the program they are for.
* There is an example config file that usually starts with a reference (source or include) to a common personal file.
  - This example file (or multiple files or directories) can be *copied* to the appropriate location on the system
- common personal settings and files have standard names, without leading '.' and ending in '-dot'.
  - e.g., 'vimrc-dot'

I really do want to change this setup: it's confusing and unnecessarily complicated.

* common personal settings with standard names, without the `.`:e.g., `vimrc`.
  - system-specific settings in files named after the platform: e.g., `mswin.vim`.
  - example local files for manual installation (e.g., windows) with the standard name, followed by `-local` and the name of the platform: e.g., `vimrc-local-win`

## Why is it like this?

Because I find there are almost always system-specific settings --- like font sizes, window sizes, or other ideosyncracies of a particular machine / environment. 
I do not want to sync these across systems, but I do want common settings to be easily accessible and automatically updated across systems.
This way, I can keep all my common dotfiles in one place, managed in a repository, while also allowing for system-specific settings.

[dotsync] now allows machine-specific settings (on macOS). 

# Reference

* [GitHub](https://github.com/)
* [GitHub Desktop](https://desktop.github.com)
* [My repos](https://github.com/jawhiteley/)

* [dotphiles](https://github.com/dotphiles/dotphiles)
  * [dotsync](https://github.com/dotphiles/dotsync)

# More Reading

* [GitHub does dotfiles](https://dotfiles.github.io)

