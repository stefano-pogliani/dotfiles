.DEFAULT_GOAL: install
.PHONY: build clean install uninstall update


VIMRC = $(HOME)/.vimrc
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Build deps
vimrc: templates/vimrc
	templetise --inline='{ "REPO_PATH": "$(REPO)" }' \
		templates/vimrc > vimrc


# Install deps
$(VIMRC): vimrc
	ln $(SYMLINK_FORCE) -s "$(REPO)/vim/vimrc" "$(VIMRC)"


# Targets
build: vimrc

clean:
	rm vimrc

install: build $(VIMRC)

uninstall:
	[ -L "$(VIMRC)" -o "$(FORCE)" == "yes" ] && rm -f "$(VIMRC)"

update:
	git submodule foreach git pull
