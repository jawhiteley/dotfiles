Manage Vim plugins with [vim-plug]

[vim-plug]: https://github.com/junegunn/vim-plug

# Commands

Command                           | Description
PlugInstall [name ...] [#threads] | Install plugins
PlugUpdate [name ...] [#threads]  | Install or update plugins
PlugClean[!]                      | Remove unused directories (bang version will clean without prompt)
PlugUpgrade                       | Upgrade vim-plug itself
PlugStatus                        | Check the status of plugins
PlugDiff                          | See the updated changes from the previous PlugUpdate
PlugSnapshot [output path]        | Generate script for restoring the current snapshot of the plugins

# Notes

Known to run on Vim >=7.0, but really should be >=7.3.
Requires git.
When installing plugins, vim-plug clones each plugin to the specified directory --- each one is a git repo itself.

I rather like the idea of keeping copies of the downloaded plugins in this folder to sync from system to system: it provides a starting point of plugins ready to install, and they can be updated as needed.
Unfortunately, this makes managing this directory within a git repo complicated: I would need submodules.
I guess I really do not need to sync these cloned plugins: if I am accessing this repo via GitHub, then I can access all the plugins, too.
There is something re-assuring about having a local copy of things to install from, just in case. But, that's what local backups are for.

It is therefore simpler to exclude the folders for each plugin here.
It also saves a bit of space.


## Managing plugins: Common or System-specific?

The other issue, however, is whether to keep the code for this plugin in my common vimrc file, or the local system-specific one.
The advantage of the common file should be really platform-independent.
Unfortunately, I might be running older versions of vim in some places (with older hardware).
I might not be able to use the current plugin versions in those cases, so I need a way of specifying plugin versions on each system.

Plus, I recently encountered errors when loading these lines using vim in the terminal on Mac OS X.
