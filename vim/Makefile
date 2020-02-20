.DEFAULT_GOAL: install
.PHONY: build clean install uninstall


VIMRC = $(HOME)/.vimrc
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Build deps
vimrc: templates/vimrc
	cat templates/vimrc | REPO_PATH="$(REPO)" envsubst '$${REPO_PATH}' > vimrc


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
