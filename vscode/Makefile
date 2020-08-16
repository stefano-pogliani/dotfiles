.PHONY: install symlinks uninstall unlink update

KEYBINDINGS = $(HOME)/.config/Code/User/keybindings.json
SETTINGS = $(HOME)/.config/Code/User/settings.json

# Top-level targets.
install:
	cat plugins.txt | while read -r plugin_id; do code --install-extension "$${plugin_id}"; done

symlinks:
	ln $(force_symlinks) -s "$(REPO)/vscode/keybindings.json" "$(KEYBINDINGS)"
	ln $(force_symlinks) -s "$(REPO)/vscode/settings.json" "$(SETTINGS)"

uninstall:
	cat plugins.txt | while read -r plugin_id; do code --uninstall-extension "$${plugin_id}"; done

unlink:
	[ -L "$(KEYBINDINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(KEYBINDINGS)"
	[ -L "$(SETTINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(SETTINGS)"

update: install
