.DEFAULT_GOAL: install
.PHONY: build clean install uninstall


CONFPATH = $(HOME)/.config/nvim
INITRC = $(CONFPATH)/init.vim
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Build deps
$(CONFPATH):
	mkdir "$(CONFPATH)"

init.vim: templates/init.vim
	cat templates/init.vim | REPO_PATH="$(REPO)" envsubst '$${REPO_PATH}' > init.vim


# Install deps
$(INITRC): $(CONFPATH) init.vim
	ln $(SYMLINK_FORCE) -s "$(REPO)/neovim/init.vim" "$(INITRC)"


# Targets
build: init.vim

clean:
	rm init.vim

install: build $(INITRC)

uninstall:
	[ -L "$(INITRC)" -o "$(FORCE)" == "yes" ] && rm -f "$(INITRC)"
