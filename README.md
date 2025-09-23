These configuration dotfiles are managed by [GNU Stow](https://www.gnu.org/software/stow/). Check, whether you have it on your system with
```sh
stow --version
```
If you do not have it, install it with your preferred package manager

After that, it becomes very simple to recreate the dotfiles on a new system

Clone the repo, `cd` into it and run `stow <app>` to create a config symlink for the app, e.g. `stow nvim` creates the `~/.config/nvim`
symlink, and now your nvim is configured according to the `~/dotfiles/nvim/.config/nvim/` config!
