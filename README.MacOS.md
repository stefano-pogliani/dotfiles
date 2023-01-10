# MacOS Quick Start

MacOS is not my default OS so support for it is hit-and-miss and won't be optimised.
These steps aim to replace the quick start in the `README.md` for MacOS specifics.

The following commands will install the configuration from the repository.
Tested on MacOS 12.4.

Preliminary tuning:

1. Install Firefox browser and set as default.
2. Fix keyboard configuration to be more PC:
   * System Preferences -> Keyboard -> Modifier Keys:
     * Command = Control
     * Control = Command
     * Repeat for each keyboard.
   * System Preferences -> Keyboard -> Input Sources: add and select `British - PC`.
3. Tune System Preferences:
   * General -> Appearance = Dark.
   * General -> Accent colour = green (or anything you feel).
   * General -> Show scroll bars = when scrolling.
   * General -> Click in the scroll bar to = Jump to the spot that's clicked.
   * General -> Default web browser = Firefox.
   * General -> Recent items = None
   * Dock & Menu Bar -> Automatically hide and show the Dock = true
   * Dock & Menu Bar -> Show recent applications in Dock = false
   * Mission Control -> Automatically rearrange spaces based on most recent use = false
   * Mission Control -> Displays have separate spaces = true
   * Mission Control -> Keyboard and Mouse Shortcuts = all set to do nothing (`-`).
   * Mission Control -> Hot Corners -> Top Left = Mission Control.
   * Mission Control -> Hot Corners -> All others = do nothing (`-`).
   * Siri = Disable all options.
   * Siri -> Siri Suggestions & Privacy = Disable all options.
   * Spotlight -> Search Results = Only apps, Definition and System Preferences.
   * Notifications & Focus -> Notifications = Disable most apps keeping what you want.
   * Security & Privacy -> Privacy -> Location Services -> Enable Location Services = false.
   * Security & Privacy -> Privacy -> Apple Advertising -> Personalised Ads = false.
   * Keyboards -> Shortcuts = Tune presets as desired.
   * Keyboards -> Shortcuts -> Mission Control -> Mission Control = Alt + Tab.
   * Keyboards -> Shortcuts -> App Shortcuts -> Add -> Lock Screen = Window + L.

Install [HomeBrew](https://brew.sh/) and essential dependencies:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)
brew install --cask itsycal
brew install --cask iterm2
brew install --cask visual-studio-code

brew install coreutils gnupg nvim pinentry-mac tmux
brew install --cask meld

brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font
```

Configure iTerm2:

1. Install iTerm2 Nord theme: <https://github.com/arcticicestudio/nord-iterm2#installation>
2. iTerm2 Preferences tuning:
   * General -> Closing -> Quit when all windows are closed = true.
   * General -> Closing -> Confirm closing multiple sessions = true.
   * General -> Selection -> Applications in terminal may access clipboard = true.
   * General -> Selection -> Automatically enter copy mode = false.
   * Appearance -> Tabs -> Show activity indicator = false.
   * Appearance -> Tabs -> Show new-output indicator = false.
   * Profiles -> Default -> Text -> Font = FiraMono Nerd Font.
   * Profiles -> Default -> Text -> Use ligatures = false.
   * Profiles -> Default -> Window -> Columns = MAX (1250; write anything above it).
   * Profiles -> Default -> Terminal -> Scrollback lines = 5000.
   * Keys -> Remap Modifiers -> Remap control key to == Left Command.
   * Keys -> Remap Modifiers -> Remap left command key to == Control.
   * Keys -> Remap Modifiers -> Remap right command key to == Control.
3. Configure copy/paste keybindings to match Gnome Terminal:
   * iTerms -> Settings -> Keys -> Key Binding -> + (at the bottom):
     * Shift + Ctrl + c == Ignore.
     * Shift + Ctrl + v == Paste.
   * System Settings -> Keyboards -> Keyboard Shortcuts -> App Shortcuts -> + (at the bottom):
     * Application == iTerm.app.
     * Menu title == `Edit - Copy`.
     * Keyboard Shortcut: Shift + Ctrl + c.

Configure Bash 5.x as the default shell:

```bash
# Install latest bash from brew.
eval $(/opt/homebrew/bin/brew shellenv)
brew install bash bash-completion

# Set homebrew bash as default shell.
sudo vi /etc/shells
> # Allow use of Bash 5.x installed with homebrew.
> /opt/homebrew/bin/bash

chsh -s /opt/homebrew/bin/bash

# Ensure brew is available to bash shells from now on.
/opt/homebrew/bin/brew shellenv > ~/.system.bashrc

# Extend PATH with new needed locations.
cat << EOF >> ~/.system.bashrc
# Favour GNU version of tools over MacOS one.
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:\$PATH"

# Add Visual Studio Code (code).
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Enable pip install --user binaries.
export PATH="/Users/stefano.pogliani/Library/Python/3.9/bin:\$PATH"

# Enable bash completion.
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[[ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]] && . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
EOF
```

Exit the terminal and re-open it, then proceed to dotfiles provisioning:

```bash
# Install rust and starship
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install starship

# Initialise global git config:
git config --global user.name "Stefano Pogliani"
git config --global user.email "<EMAIL>"
git config --global core.editor nvim

# Fetch this repo and install configs.
git clone --recursive https://github.com/stefano-pogliani/dotfiles.git
cd dotfiles

# Set the appropriate profile for the system.
# We can override in CLI but this helps to avoid mistakes.
echo 'work' > ~/.dot.profile
echo 'export TARGET_MACOS=yes' > ~/.dot.variables
echo 'export TMUX_CLIPBOARD=macos' >> ~/.dot.variables

# NOTE: Many plugins are installed as part of this.
make provision
# To update the local configuration on a provisioned system:
make sync

# MacOS will only load ~/.profile for interactive shells.
echo 'source ~/.bashrc' > ~/.profile

# ADDITIONAL TASKS:
#  * Generate SSH key and add to places (if needed)
#  * Generate GPG key and add to places (if needed)
```

## GPG additional changes

```bash
# Configure the pinentry program for keychain support.
echo 'pinentry-program /opt/homebrew/bin/pinentry-mac' >> ~/.gnupg/gpg-agent.conf
```

## Mac messed with the keyboard again

In case of layout issues reset keyboard assistant data and re-identify the keyboard:

1. Disconnect all devices from Mac.
2. `sudo rm /Library/Preferences/com.apple.keyboardtype.plist`
3. Reboot.
4. Reconnect the external keyboard and follow assistant instructions.

Ref: <https://www.techwalla.com/articles/how-to-reset-the-external-keyboard-on-an-apple-mac>
