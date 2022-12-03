.DEFAULT_GOAL := sync
.PHONY: deprovision help install provision render symlinks sync uninstall unlink unrender update variables

# Export variables so sub-makes have them set.
export PROFILE_ID_FILE := $(HOME)/.dot.profile
export PROFILE = $(shell if [ -e $(PROFILE_ID_FILE) ]; then cat $(PROFILE_ID_FILE); else echo "personal"; fi)
export VARIABLES_FILE  := $(HOME)/.dot.variables

export FORCE = no
export REPO ?= $(CURDIR)
export TARGET_MACOS = no

# Load instance variables.
ifneq (, $(wildcard $(VARIABLES_FILE)))
	include $(VARIABLES_FILE)
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
	@$(MAKE) -C asdf/ install
	@$(MAKE) -C neovim/ install
ifeq ($(TARGET_MACOS), no)
	@$(MAKE) -C term/ install
endif
	@$(MAKE) -C tmux/ install
	@$(MAKE) -C vscode/ install

provision: render symlinks install

render:
	@$(MAKE) -C bash/ render
	@$(MAKE) -C neovim/ render
	@$(MAKE) -C tmux/ render

symlinks:
	@$(MAKE) -C asdf/ symlinks
	@$(MAKE) -C bash/ symlinks
	@$(MAKE) -C neovim/ symlinks
	@$(MAKE) -C starship/ symlinks
	@$(MAKE) -C tmux/ symlinks
	@$(MAKE) -C vscode/ symlinks

sync: render install

uninstall:
	@$(MAKE) -C asdf/ uninstall
	@$(MAKE) -C neovim/ uninstall
ifeq ($(TARGET_MACOS), no)
	@$(MAKE) -C term/ uninstall
endif
	@$(MAKE) -C tmux/ uninstall
	@$(MAKE) -C vscode/ uninstall

unlink:
	@$(MAKE) -C asdf/ unlink
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
	@$(MAKE) -C asdf/ update
	@$(MAKE) -C neovim/ update
	@$(MAKE) -C starship/ update
	@$(MAKE) -C tmux/ update
	@$(MAKE) -C vscode/ update

variables:
	@echo "Force:        $(FORCE)"
	@echo "Profile:      $(PROFILE)"
	@echo "Repo:         $(REPO)"
	@echo "Target MacOS: $(TARGET_MACOS)"
	@$(MAKE) --silent -C tmux/ variables
