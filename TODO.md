Jonathan Whiteley
2017-06-04

+ add dotsync submodule to repo.
    + edit install.sh script to automatically run dotsync commands
    + modify dotsync to accept any local host as valid, if default listed in dotsyncrc (host "[DEFAULT]") - and use those settings for any local host not listed.
    - modify dotsync to check for host root directory (`[HOST]`; for any path), before checking for a host-specific file within a `dotfile.d` directory?
        - Machine-specific dotfiles are already possible for any path: e.g., a host-specific dotsyncrc file in `~/` (which is why I do *not* symlink the `dotsyncrc` file itself), or the `files=` argument of a host line within dotsyncrc. But, that can get long and messy with several (longish) paths.
        - Machine-specific files can also be specified for any path by simply creating a directory with the same name as the generic file (same path in `dotsyncrc`) plus `.d` at the end. Machine-specific (or local-only `localhost`) dotfiles can go in there.
        - e.g., `/vim/vimrc.d/localhost`


* R script to install .Renviron and .Rprofile to HOME (platform-independent, but mostly to get R running faster on Windows).


