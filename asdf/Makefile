.PHONY: install symlinks uninstall unlink update plugins_list tools_list

# "Internal" targets.
export ASDFVM_HOME = "$(REPO)/asdf/repo"

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
	cat plugins.txt | xargs -L1 $(ASDFVM_HOME)/bin/asdf plugin add || true
	$(ASDFVM_HOME)/bin/asdf install

symlinks:
	ln $(force_symlinks) -s "$(REPO)/asdf/.tool-versions" "$(HOME)/.tool-versions"

uninstall: plugins_list tools_list
	grep -v '^#' .tool-versions | xargs -L1 $(ASDFVM_HOME)/bin/asdf uninstall || true
	cat plugins.txt | xargs -L1 $(ASDFVM_HOME)/bin/asdf plugin remove || true

unlink:
	[ -L "$(HOME)/.tool-versions" -o "$(FORCE)" == "yes" ] && rm -f "$(HOME)/.tool-versions"

update:
	$(ASDFVM_HOME)/bin/asdf plugin update --all
