.PHONY: install symlinks uninstall unlink update plugins_list

CODE_MODE ?= codium

CODE_CLI := $(shell if [ "$(CODE_MODE)" == "ms-code" ]; then echo "code"; else echo "codium"; fi)
CODE_CONF_DIR := $(shell if [ "$(CODE_MODE)" == "ms-code" ]; then echo "Code"; else echo "VSCodium"; fi)
OS_CONF_PATH := $(shell if [ "$(TARGET_MACOS)" == "no" ]; then echo "$(HOME)/.config"; else echo "$(HOME)/Library/Application Support"; fi)
KEYBINDINGS := $(OS_CONF_PATH)/$(CODE_CONF_DIR)/User/keybindings.json
SETTINGS := $(OS_CONF_PATH)/$(CODE_CONF_DIR)/User/settings.json

# "Internal" targets.
plugins_list:
	cat plugins.all.txt | grep -v '#' > plugins.txt
	if [ -e plugins.$(PROFILE).txt ]; then cat plugins.$(PROFILE).txt | grep -v '#' >> plugins.txt; fi
	if [ -e plugins.$(CODE_MODE).txt ]; then cat plugins.$(CODE_MODE).txt | grep -v '#' >> plugins.txt; fi

# Top-level targets.
install: plugins_list
	cat plugins.txt | xargs -L1 $(CODE_CLI) --install-extension

symlinks:
	mkdir -p "$(REPO)/vscode"
	ln $(force_symlinks) -s "$(REPO)/vscode/keybindings.json" "$(KEYBINDINGS)"
	ln $(force_symlinks) -s "$(REPO)/vscode/settings.json" "$(SETTINGS)"

uninstall: plugins.txt
	cat plugins.txt | xargs -L1 $(CODE_CLI) --uninstall-extension

unlink:
	[ -L "$(KEYBINDINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(KEYBINDINGS)"
	[ -L "$(SETTINGS)" -o "$(FORCE)" == "yes" ] && rm -f "$(SETTINGS)"

update: plugins_list
	cat plugins.txt | xargs -I '{PLUGIN}' $(CODE_CLI) --install-extension "{PLUGIN}" --force

variables:
	@echo "  Mode: $(CODE_MODE)"
	@echo "  Command name: $(CODE_CLI)"
	@echo "  Keybindings path: $(KEYBINDINGS)"
	@echo "  Settings path: $(SETTINGS)"
