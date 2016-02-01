My user env configuration
=========================
Configuration and personalisation files for bash, tmux, vim, and such.


Quick start
-----------
The following commands will install the configuration from the repository.

On Fedora run:
```bash
sudo yum install make powerline tmux vim

curl --silent --location https://rpm.nodesource.com/setup_5.x | sudo -E bash -
sudo yum install nodejs
sudo npm install -g templetise

make
```

On Manjaro (Arch-base distro):
```bash
sudo pacman --sync make powerline tmux vim

sudo pacman --sync nodejs npm
sudo npm install -g templetise

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
```bash
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
