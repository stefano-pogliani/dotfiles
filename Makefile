.DEFAULT_GOAL := sync
.PHONY: deprovision help install provision render symlinks sync uninstall unlink unrender update variables

# Export variables so sub-makes have them set.
export FORCE = no
export PROFILE = personal
export REPO ?= $(CURDIR)
export TARGET_MACOS = no

# Set TARGET_MACOS if PROFILE == work
ifeq ($(PROFILE), work)
	TARGET_MACOS = yes
endif

# Enable forced flags if FORCE=yes
force_symlinks = 
ifeq ($(FORCE), yes)
	force_symlinks = --force
endif
export force_symlinks

deprovision: uninstall unlink unrender

help:
	@cat help.txt

install:
	@$(MAKE) -C neovim/ install
	@$(MAKE) -C term/ install
	@$(MAKE) -C tmux/ install
	@$(MAKE) -C vscode/ install

provision: render symlinks install

render:
	@$(MAKE) -C bash/ render
	@$(MAKE) -C neovim/ render
	@$(MAKE) -C tmux/ render

symlinks:
	@$(MAKE) -C bash/ symlinks
	@$(MAKE) -C neovim/ symlinks
	@$(MAKE) -C starship/ symlinks
	@$(MAKE) -C tmux/ symlinks
	@$(MAKE) -C vscode/ symlinks

sync: render install

uninstall:
	@$(MAKE) -C neovim/ uninstall
	@$(MAKE) -C term/ uninstall
	@$(MAKE) -C tmux/ uninstall
	@$(MAKE) -C vscode/ uninstall

unlink:
	@$(MAKE) -C bash/ unlink
	@$(MAKE) -C neovim/ unlink
	@$(MAKE) -C starship/ unlink
	@$(MAKE) -C tmux/ unlink
	@$(MAKE) -C vscode/ unlink

unrender:
	@$(MAKE) -C bash/ unrender
	@$(MAKE) -C neovim/ unrender
	@$(MAKE) -C tmux/ unrender

update:
	git submodule update --remote
	@$(MAKE) -C neovim/ update
	@$(MAKE) -C starship/ update
	@$(MAKE) -C tmux/ update
	@$(MAKE) -C vscode/ update

variables:
	@echo "Force:        $(FORCE)"
	@echo "Profile:      $(PROFILE)"
	@echo "Repo:         $(REPO)"
	@echo "Target MacOS: $(TARGET_MACOS)"
