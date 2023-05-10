.PHONY: render symlinks unlink update

SHIP_DIR  = $(HOME)/.config
SHIP_CONF = $(SHIP_DIR)/starship.toml

# Check if we should cargo install --force.
force_install =
ifeq ($(FORCE), yes)
	force_install = --force
endif

# "Internal" targets.
$(SHIP_DIR):
	mkdir -p $(SHIP_DIR)

starship.toml: starship.all.toml starship.$(PROFILE).toml
	cat starship.all.toml > starship.toml
	cat starship.$(PROFILE).toml >> starship.toml

# Top-level targets.
render: starship.toml

symlinks: $(SHIP_DIR)
	ln $(force_symlinks) --no-dereference -s "$(REPO)/starship/starship.toml" "$(SHIP_CONF)"

unlink:
	[ -L "$(SHIP_CONF)" -o "$(FORCE)" == "yes" ] && rm -f "$(SHIP_CONF)"

update:
	cargo install $(force_install) starship --locked
