.DEFAULT_GOAL := install
.PHONY: build clean help install uninstall update variables


export FORCE = no
export POWER_ROOT := $(shell "./find-powerline.sh")
export REPO ?= $(CURDIR)


build:
	$(MAKE) -C bash/ build
	$(MAKE) -C neovim/ build
	$(MAKE) -C powerline/ build
	$(MAKE) -C tmux/ build


clean:
	$(MAKE) -C bash/ clean
	$(MAKE) -C neovim/ clean
	$(MAKE) -C powerline/ clean
	$(MAKE) -C tmux/ clean


help:
	@cat help.txt


install:
	$(MAKE) -C bash/ install
	$(MAKE) -C neovim/ install
	$(MAKE) -C powerline/ install
	$(MAKE) -C tmux/ install


reinstall: uninstall clean install


uninstall:
	$(MAKE) -C bash/ uninstall
	$(MAKE) -C neovim/ uninstall
	$(MAKE) -C powerline/ uninstall
	$(MAKE) -C tmux/ uninstall


update:
	git submodule update --remote


variables:
	@echo "Force: $(FORCE)"
	@echo "Repo:  $(REPO)"
	@echo "Powerline root: $(POWER_ROOT)"
