.PHONY: install symlinks uninstall unlink update plugins_list

KEYBINDINGS = $(HOME)/.config/Code/User/keybindings.json
SETTINGS = $(HOME)/.config/Code/User/settings.json

# "Internal" targets.
plugins_list:
	cat plugins.all.txt > plugins.txt
	if [ -e plugins.$(PROFILE).txt ]; then cat plugins.$(PROFILE).txt >> plugins.txt; fi

# Top-level targets.
install: plugins_list
	cat plugins.txt | while read -r plugin_id; do code --install-extension "$${plugin_id}"; done

symlinks:
	ln $(force_symlinks) -s "$(REPO)/vscode/keybindings.json" "$(KEYBINDINGS)"
	ln $(force_symlinks) -s "$(REPO)/vscode/settings.json" "$(SETTINGS)"

uninstall: plugins.txt
	cat plugins.txt | while read -r plugin_id; do code --uninstall-extension "$${plugin_id}"; done

unlink:
	[ -L "$(KEYBINDINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(KEYBINDINGS)"
	[ -L "$(SETTINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(SETTINGS)"

update: plugins_list
	cat plugins.txt | while read -r plugin_id; do code --install-extension "$${plugin_id}" --force; done
