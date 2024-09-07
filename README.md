# My env configuration

Configuration and personalisation files for bash, tmux, and others.

## OS

The scripts and configurations in this repository are mainly for terminal,
development tools and similar utilities.

But before they can be configured the OS layer has to be configured to my preferences.
These options are harder to automate and rarely change after first install so are done manually.

1. Check time zone and BIOS date with `timedatectl`.
2. Have a look at available `Settings` to adjust as desired.
3. Log into Firefox accounts so tabs, bookmarks and other get synced and are available.
4. Configure Firefox:
   - Disable built-in advertise tracking.
   - Have a look at Firefox settings and adjust as desired.
   - Customise the toolbar to:
    `<-, ->, Home, Refresh, URL Bar, Bookmarks, Downloads, Account, Extensions`.
   - Set enhanced tracking protection to strict.
   - In `about:config` change the following settings:

     ```text
     extensions.activeThemeID:         lush-bold-colorway@mozilla.org
     toolkit.tabbox.switchByScrolling: true
     ```

5. Install the following Firefox Extensions: Psono, Forget Me Not, Deyond20, uBlock Origin.
6. Install Gnome Tweaks and tune options.
   - Check available options and adjust as desired.
   - Set the "legacy theme" to the dark theme variant.
7. Install the Extensions app and the following Gnome extensions:
   `AppIndicator and KStatusNotifierItem Support, Caffeine/Espresso, Removable Drive Menu`.
8. Pin apps on the "start menu": Firefox, Terminal, VS Code, Files.

## Terminal/Development

The following commands will install the configuration from the repository.
Tested on Fedora 38.

```bash
# Install requirements available from OS packages.
sudo dnf install \
  cmake \
  fd-find \
  fzf \
  gcc-c++ \
  git \
  make \
  neovim \
  openssl \
  openssl-devel \
  podman \
  ripgrep \
  tmux \
  wl-clipboard \
  xsel

# Install rust.
curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh
rustup component add clippy rustfmt

# Install Visual Studio Code
# --> Start by adding the official Fedora repo:
#     https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
sudo dnf check-update
sudo dnf install code

# Initialise global git config:
git config --global user.name "Stefano Pogliani"
git config --global user.email "<EMAIL>"
git config --global core.editor nvim
git config --global init.defaultBranch main

# Set per-instance configuration (personal can be omitted as the default).
# Checkout next session for available variables.
echo 'personal' > "${HOME}/.dot.profile"
echo 'export TMUX_CLIPBOARD=fedora-x' > "${HOME}/.dot.variables"

# Fetch this repo and install configs.
git clone --recursive https://github.com/stefano-pogliani/dotfiles.git
cd dotfiles
# NOTE: Many plugins are installed as part of this.
make provision
# To update the local configuration on a provisioned system:
make sync

# ADDITIONAL TASKS:
#  * Generate SSH key and add to places (if needed)
ssh-keygen -t ed25519 -C "$USER@$HOST"
#  * Generate GPG key and add to places (if needed)
```

## Per-instance variables

The aim of this repo is to provide a consistent experience across multiple PCs and environments.
To enable that some customisation is supported to transparently tune implementation of some
features.

| Variable Name | Description | Default |
| ------------- | ----------- | ------- |
| `TARGET_MACOS` | The dotfile configuration is being applied on a MacOS instance | `no` |
| `TMUX_CLIPBOARD` | Tune how tmux will copy text into the system clipboard | `fedora-wayland` |

## Dependencies

The following tools are required for this configuration to be installed:

- `envsubst`: used to convert templates into system-specific files.
- `git`: used to fetch this repo and by some tools it configures (for example `asdf`).
- `make`: used to automate build and installation.
- `sort`: used to de-duplicate entries to support profile defaults.
- `xargs`: used to execute commands on list of plugins (and similar).

## Git Commit sining

I've chosen to use (move to) SSH for commit signing (because GPG is a mess with keys).

To set it up we'll need:

1. An SSH key for signing.
2. A list of SSH key we consider valid for sining.
3. The proper config for `git`.

```bash
git config --global gpg.format ssh
git config --global user.signingKey ~/.ssh/git_sign.pub
git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers

git config --global commit.gpgsign true
```

The git allowed signers format is:

```text
<COMMITER EMAIL> <SSH PUBLIC KEY>
```

### Creating an SSH sining key

Generate a new SSH key with passphrase:

```bash
$ ssh-keygen -C 'SP Git Signature' # If not default: -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/stefano/.ssh/id_ed25519): /home/stefano/.ssh/git_sign
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/stefano/.ssh/git_sign
Your public key has been saved in /home/stefano/.ssh/git_sign.pub
The key fingerprint is:
...
The key's randomart image is:
...
```

It is possible to remove passphrases from keys:

```bash
ssh-keygen -f ~/.ssh/git_sign -p
```

To re-derive the public key from a private key:

```bash
ssh-keygen -f ~/.ssh/git_sign -y
```

### References

- <https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work>
- <https://help.github.com/en/articles/signing-commits>
- <https://help.github.com/en/articles/generating-a-new-gpg-key>
- <https://tr.opensuse.org/SDB:Using_gpg-agent>
- <https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/>

## Mini road map

- Figure out [Nerd Fonts](https://www.nerdfonts.com/) instead of `powerline-fonts`.
- Tmux Resurrect?
- Check out TMUX mouse support and if it is possible to keep text selection.

## File organisation

Configuration files are divided by application they configure.
Symlinks are installed to point applications' user configs to files in this repository.

## Pane navigation

Both VIM and TMUX have interfaces that support panes.
And that means navigating across them!

Here is a unified configuration for all pane navigation and layout manipulation.
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
