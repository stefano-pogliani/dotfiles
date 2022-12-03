.PHONY: install symlinks uninstall unlink update plugins_list tools_list

# "Internal" targets.
export ASDF_DIR = $(REPO)/asdf/repo

plugins_list:
	cat plugins.all.txt > plugins.txt
	if [ -e plugins.$(PROFILE).txt ]; then cat plugins.$(PROFILE).txt >> plugins.txt; fi

tools_list:
  # Profile tools must be first as sort de-duplicates keeping the first entry.
	echo -n '' > .tool-versions
	if [ -e tools.$(PROFILE).txt ]; then cat tools.$(PROFILE).txt > .tool-versions; fi
	cat tools.all.txt >> .tool-versions

# Top-level targets.
install: plugins_list tools_list
  # Errors installing plugins are ignored as re-adding a plugin counts as an error.
	cat plugins.txt | grep -v '^#' | xargs -L1 $(ASDF_DIR)/bin/asdf plugin add || true
	$(ASDF_DIR)/bin/asdf install

symlinks:
	ln $(force_symlinks) -s "$(REPO)/asdf/.tool-versions" "$(HOME)/.tool-versions"

uninstall: plugins_list tools_list
	grep -v '^#' .tool-versions | xargs -L1 $(ASDF_DIR)/bin/asdf uninstall || true
	cat plugins.txt | xargs -L1 $(ASDF_DIR)/bin/asdf plugin remove || true

unlink:
	[ -L "$(HOME)/.tool-versions" -o "$(FORCE)" == "yes" ] && rm -f "$(HOME)/.tool-versions"

update:
	$(ASDF_DIR)/bin/asdf update
	$(ASDF_DIR)/bin/asdf plugin update --all
