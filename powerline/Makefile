.DEFAULT_GOAL := install
.PHONY: build clean install uninstall


PL_DIR  = $(HOME)/.config
PL_CONF = $(PL_DIR)/powerline
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Install deps
$(PL_DIR):
	mkdir -p $(PL_DIR)

# After the symlink is created, update the directory so that make will not run this again.
$(PL_CONF): $(PL_DIR)
	ln $(SYMLINK_FORCE) --no-dereference -s "$(REPO)/powerline/configuration" "$(PL_CONF)"
	touch "$(REPO)/powerline/configuration"


# Targets
build:

clean:

install: $(PL_CONF)
	powerline-daemon --replace

uninstall:
	[ -L "$(PL_CONF)" -o "$(FORCE)" == "yes" ] && rm -f "$(PL_CONF)"
