.DEFAULT_GOAL := install
.PHONY: build clean install uninstall


BASHRC = $(HOME)/.bashrc
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Build deps
bashrc: templates/bashrc
	cat templates/bashrc | \
		REPO_PATH="$(REPO)" envsubst '$${REPO_PATH}' \
		> bashrc


# Install deps
$(BASHRC): bashrc
	ln $(SYMLINK_FORCE) -s "$(REPO)/bash/bashrc" "$(BASHRC)"


# Targets
build: bashrc

clean:
	rm bashrc

install: build $(BASHRC)

uninstall:
	[ -L "$(BASHRC)" -o "$(FORCE)" == "yes" ] && rm -f "$(BASHRC)"
