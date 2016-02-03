.DEFAULT_GOAL: install
.PHONY: build clean install uninstall


TMUX_CONF = $(HOME)/.tmux.conf
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Build deps
tmux.conf: templates/tmux.conf
	templetise                                      \
		--inline='{ "REPO_PATH": "$(REPO)" }'         \
		--inline='{ "POWER_ROOT": "$(POWER_ROOT)" }'  \
		--helpers=templates/helpers.js                \
		templates/tmux.conf > tmux.conf


# Install deps.
$(TMUX_CONF): tmux.conf
	ln $(SYMLINK_FORCE) -s "$(REPO)/tmux/tmux.conf" "$(TMUX_CONF)"


# Targets
build: tmux.conf

clean:
	rm tmux.conf

install: build $(TMUX_CONF)

uninstall:
	[ -L "$(TMUX_CONF)" -o "$(FORCE)" == "yes" ] && rm -f "$(TMUX_CONF)"

update:
	git submodule foreach git pull
