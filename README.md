# My env configuration
Configuration and personalisation files for bash, tmux, neovim, and others.


## Quick start
The following commands will install the configuration from the repository.

On Fedora 32 run:
```bash
# Install OS provided packages.
sudo dnf install fd-find fzf git make neovim podman powerline-fonts ripgrep tmux wl-clipboard
# To make VS Code popups about missing docker go away (docker commands still fail):
#sudo dnf install podman-docker

# Install rust and starship
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install starship

# Install Visual Studio Code
# --> Start by adding the official Fedora repo:
#     https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
sudo dnf check-update
sudo dnf install code

# Initialise global git config:
git config --global user.name "Stefano Pogliani"
git config --global user.email "<EMAIL>"
git config --global core.editor nvim

# Fetch this repo and install configs.
git clone --recursive https://github.com/stefano-pogliani/dotfiles.git
cd dotfiles
# NOTE: Many plugins are installed as part of this.
make provision #[PROFILE=work]
# To update the local configuration on a provisioned system:
make sync #[PROFILE=work]

# ADDITIONAL TASKS:
#  * Generate SSH key and add to places (if needed)
#  * Generate GPG key and add to places (if needed)
#  -> Install extend and configure rust.
rustup component add clippy rustfmt
cargo install cargo-audit cargo-outdated

#  -> Install asdf plugins and tools.
#     First install suggested dependencies for plugins:
#       https://asdf-vm.com/#/core-manage-asdf-vm?id=plugin-dependencies
asdf plugin-add <TOOL>
asdf install <TOOL> latest
asdf global <TOOL> <VERSION>

#  -> For gohugo.io, to support the extended version
asdf plugin-add hugo https://github.com/beardix/asdf-hugo.git
asdf install hugo extended-<VERSION>
asdf global hugo extended-<VERSION>
```


## Dependencies
The following tools are required for this configuration to be installed:

  * `envsubst`: used to convert templates into system-specific files.
  * `make`: used to automate build and installation.


## GPG Configuration
GPG is useful to sign various documents, in particular git commits.
Configuration is now the easiest though, especially when gpg-agent is desired.

The `.bashrc` configuration installed by this repo will automatically start
a GPG agent and set the `GPG_AGENT_INFO` environment variable to point at it.
The GPG agent can then be used to cache GPG passphrases and store and load
them from the OS keyring so you don't have to type them every time.

### Creating a GPG key
```bash
# Check available keys.
gpg --list-keys

# Create a new key:
#  - Pick a good passphrase as that will be stored in a keyring.
#  - Pick 4096 bits for the key size.
gpg --gen-key

# Get the new key ID and export the public key to GitHub:
gpg --list-secret-keys --keyid-format LONG
gpg --export --armor KEY_ID

# Configure GPG with the `use-agent` directive:
vim ~/.gnupg/gpg.conf

# Create the GPG agent configuration:
#  We at least want the following settings.
#  Advanced configurations are also possible.
echo 'no-grab' > ~/.gnupg/gpg-agent.conf
echo 'default-cache-ttl 3600' >> ~/.gnupg/gpg-agent.conf

# Confgure git to sign commits.
git config --global commit.gpgsign true
git config --global user.signingkey KEY_ID
```

### References

  * https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work
  * https://help.github.com/en/articles/signing-commits
  * https://help.github.com/en/articles/generating-a-new-gpg-key
  * https://tr.opensuse.org/SDB:Using_gpg-agent


## File organisation
Configuration files are divided by application they configure.
Symlinks are installed to point applications' user configs to files in this repository.


## Pane navigation
Both VIM and TMUX have interfaces that support panes.
And that means navigating through them!

Here is defined a unified configuration for all pane navigation
and layout manipulation.
As the programs have different features, sometime consistency is
either not possible or too limiting, in which case use what is
most appropriate for the program instaed.

The following configuration should be matched:
```text
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

### VS Code
Visual Studio Code has editor groups which are similar to panels.
Navigation shortcuts are similar to the above but sometimes they change.
For details check the `vscode/keybindings.json` file.
