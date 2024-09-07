.PHONY: install symlinks uninstall unlink update plugins_list

OS_CONF_PATH := $(shell if [ "$(TARGET_MACOS)" == "no" ]; then echo "$(HOME)/.config"; else echo "$(HOME)/Library/Application Support"; fi)
KEYBINDINGS := $(OS_CONF_PATH)/Code/User/keybindings.json
SETTINGS := $(OS_CONF_PATH)/Code/User/settings.json

# "Internal" targets.
plugins_list:
	cat plugins.all.txt > plugins.txt
	if [ -e plugins.$(PROFILE).txt ]; then cat plugins.$(PROFILE).txt >> plugins.txt; fi

# Top-level targets.
install: plugins_list
	cat plugins.txt | xargs -L1 code --install-extension

symlinks:
	mkdir -p "$(REPO)/vscode"
	ln $(force_symlinks) -s "$(REPO)/vscode/keybindings.json" "$(KEYBINDINGS)"
	ln $(force_symlinks) -s "$(REPO)/vscode/settings.json" "$(SETTINGS)"

uninstall: plugins.txt
	cat plugins.txt | xargs -L1 code --uninstall-extension

unlink:
	[ -L "$(KEYBINDINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(KEYBINDINGS)"
	[ -L "$(SETTINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(SETTINGS)"

update: plugins_list
	cat plugins.txt | xargs -I '{PLUGIN}' code --install-extension "{PLUGIN}" --force
