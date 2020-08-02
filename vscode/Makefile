.DEFAULT_GOAL := install
.PHONY: install uninstall


KEYBINDINGS = $(HOME)/.config/Code/User/keybindings.json
SETTINGS = $(HOME)/.config/Code/User/settings.json
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Targets
install:
	# Install extentions.
	code --install-extension arcticicestudio.nord-visual-studio-code
	code --install-extension ms-azuretools.vscode-docker
	code --install-extension rust-lang.rust
	# Set up configuration files.
	ln $(SYMLINK_FORCE) -s "$(REPO)/vscode/keybindings.json" "$(KEYBINDINGS)"
	ln $(SYMLINK_FORCE) -s "$(REPO)/vscode/settings.json" "$(SETTINGS)"

uninstall:
	# Remove custom configurations.
	[ -L "$(KEYBINDINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(KEYBINDINGS)"
	[ -L "$(SETTINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(SETTINGS)"
	# Uninstall extentions.
	code --uninstall-extension arcticicestudio.nord-visual-studio-code
	code --uninstall-extension ms-azuretools.vscode-docker
	code --uninstall-extension rust-lang.rust
