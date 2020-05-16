.DEFAULT_GOAL := install
.PHONY: build clean install uninstall


SHIP_DIR  = $(HOME)/.config
SHIP_CONF = $(SHIP_DIR)/starship.toml
ifeq ($(FORCE), yes)
	SYMLINK_FORCE = --force
endif


# Install deps
$(SHIP_DIR):
	mkdir -p $(SHIP_DIR)

# After the symlink is created, update the directory so that make will not run this again.
$(SHIP_CONF): $(SHIP_DIR)
	ln $(SYMLINK_FORCE) --no-dereference -s "$(REPO)/starship/starship.toml" "$(SHIP_CONF)"


# Targets
build:

clean:

install: $(SHIP_CONF)

uninstall:
	[ -L "$(SHIP_CONF)" -o "$(FORCE)" == "yes" ] && rm -f "$(SHIP_CONF)"
