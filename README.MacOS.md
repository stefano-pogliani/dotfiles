# MacOS Quick Start

MacOS is not my default OS so support for it is hit-and-miss and won't be optimised.
These steps aim to replace the quick start in the `README.md` for MacOS specifics.

The following commands will install the configuration from the repository.
Tested on MacOS 10.15.

```bash
# Install brew from https://brew.sh/
#TODO(stefano): copy commands

# Install dependencies with brew.
#TODO(stefano): list brew deps

# Install rust and starship
#TODO(stefano): install rust
cargo install starship

# Install Visual Studio Code
#TODO(stefano): install vscode

# Initialise global git config:
git config --global user.name "Stefano Pogliani"
git config --global user.email "<EMAIL>"
git config --global core.editor nvim

# Fetch this repo and install configs.
git clone --recursive https://github.com/stefano-pogliani/dotfiles.git
cd dotfiles
# NOTE: Many plugins are installed as part of this.
make provision PROFILE=work
# To update the local configuration on a provisioned system:
make sync PROFILE=work

# ADDITIONAL TASKS:
#  * Generate SSH key and add to places (if needed)
#  * Generate GPG key and add to places (if needed)
```
