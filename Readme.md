My env configuration
====================
Configuration and personalisation files for bash, tmux, vim, and such.


Quick start
-----------
The following commands will install the configuration from the repository.

On Fedora run:
```bash
sudo yum install git make tmux vim
sudo pip install powerline-status

curl --silent --location https://rpm.nodesource.com/setup_5.x | sudo -E bash -
sudo yum install nodejs
sudo npm install -g templetise

git clone https://github.com/stefano-pogliani/dotfiles.git
cd dotfiles
make
```

On Manjaro (Arch-based distro):
```bash
sudo pacman --sync python-pip ttf-dejavu-sans-mono-powerline
sudo pip install powerline-status

sudo pacman --sync nodejs npm
sudo npm install -g templetise

git clone https://github.com/stefano-pogliani/dotfiles.git
cd dotfiles
make
```


Dependencies
------------
The following tools are required for this configuration to be installed:

  * `make`: used to automate build and installation.
  * `node`: required to run the templating tool.
  * `npm`: required to install the templating tool.
  * `templetise`: the templating tool.


Make interface
--------------
Configurations in this repository are applied to the user with `make`.
For more information use `make help`:
```
make
  Alias for `make install`

make build
  Some configuration files are built out of templates.

make clean
  Deletes the generated configuration files.

make help
  Prints this message.

make install [FORCE=yes]
  Installs the configuration for the current user by symlinking to
  the files in this repository.

  If FORCE is set to yes, existing files are replaced with symlinks.

make reinstall
  Uninstalls, cleans, and then installs the configuration files.

make uninstall
  Deletes the symlinks to the configuration files.

make update
  For components that carry dependencies (like vim bundles),
  update those dependencies.

make variables
  Shows the variables used o tweak other actions and their current value.
```


File organisation
-----------------
Configuration files are divided by application they configure.
Symlinks are installed to point application's per-user paths to
the config files in this repository as follow:

  * `bash`: `~/.bashrc -> bash/bashrc`
  * `tmux`: `~/.tmux.conf -> tmux/tmux.conf`
  * `vim`:  `~/.vimrc -> vim/vimrc`


Pane navigation
---------------
Both VIM and TMUX have interfaces that support panes.
And that means navigating through them!

Here is defined a unified configuration for all pane navigation
and layout manipulation.
As the programs have different features, sometime consistency is
either not possible or too limiting, in which case use what is
most appropriate for the program instaed.

The following configuration should be matched:
```
Select pane above:        Alt + ↑
Select pane below:        Alt + ↓
Select pane on the left:  Alt + ←
Select pane on the right: Alt + →

Select leftmost pane:  Alt + PageUp
Select rightmost pane: Alt + PageDown

Swap with pane above:        Alt + Shift + ↑
Swap with pane below:        Alt + Shift + ↓
Swap with pane on the left:  Alt + Shift + ←
Swap with pane on the right: Alt + Shift + →

Move tab to the left:  Ctrl + Shift + ←
Move tab to the right: Ctrl + Shift + →

Move to previous word: Ctrl + ←
Move to next word:     Ctrl + →
```

Tmux uses `Prefix` in front of the key combination in place of the `Alt`
key to avoid intercepting the combination sent to nested programs.


Todo
----

  * Check all commands/packages on arch linux.

Tmux:
  * Tweak tmux powerline.
  * tmux-yank

Vim:
  * Conque Shell.
  * Vim GDB integration.
  * Vim NodeJs debugger.
  * Write and include StDebug for standard debugging interface.
