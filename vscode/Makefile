.PHONY: install symlinks uninstall unlink update plugins_list

KEYBINDINGS = $(HOME)/.config/Code/User/keybindings.json
SETTINGS = $(HOME)/.config/Code/User/settings.json

# "Internal" targets.
plugins_list:
	cat plugins.all.txt > plugins.txt
	if [ -e plugins.$(PROFILE).txt ]; then cat plugins.$(PROFILE).txt >> plugins.txt; fi

# Top-level targets.
install: plugins_list
	cat plugins.txt | xargs -L1 code --install-extension

symlinks:
	ln $(force_symlinks) -s "$(REPO)/vscode/keybindings.json" "$(KEYBINDINGS)"
	ln $(force_symlinks) -s "$(REPO)/vscode/settings.json" "$(SETTINGS)"

uninstall: plugins.txt
	cat plugins.txt | xargs -L1 code --uninstall-extension

unlink:
	[ -L "$(KEYBINDINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(KEYBINDINGS)"
	[ -L "$(SETTINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(SETTINGS)"

update: plugins_list
	cat plugins.txt | xargs -L1 -I '{PLUGIN}' code --install-extension "{PLUGIN}" --force
