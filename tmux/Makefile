.DEFAULT_GOAL: install
.PHONY: build clean install uninstall


TMUX_CONF = $(HOME)/.tmux.conf
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Build deps
tmux.conf: templates/tmux.conf
	cat templates/tmux.conf | REPO_PATH="$(REPO)" POWER_ROOT="$(POWER_ROOT)" envsubst \
		'$${REPO_PATH} $${POWER_ROOT}' > tmux.conf


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
