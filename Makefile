.DEFAULT_GOAL: install
.PHONY: build clean help install uninstall update variables


export FORCE = no
export POWER_ROOT := $(shell "./find-powerline.sh")
export REPO ?= $(CURDIR)


build:
	$(MAKE) -C bash/ build
	$(MAKE) -C powerline/ build
	$(MAKE) -C tmux/ build
	$(MAKE) -C vim/ build


clean:
	$(MAKE) -C bash/ clean
	$(MAKE) -C powerline/ clean
	$(MAKE) -C tmux/ clean
	$(MAKE) -C vim/ clean


help:
	@cat help.txt


install:
	$(MAKE) -C bash/ install
	$(MAKE) -C powerline/ install
	$(MAKE) -C tmux/ install
	$(MAKE) -C vim/ install


reinstall: uninstall clean install


uninstall:
	$(MAKE) -C bash/ uninstall
	$(MAKE) -C powerline/ uninstall
	$(MAKE) -C tmux/ uninstall
	$(MAKE) -C vim/ uninstall


update:
	$(MAKE) -C tmux/ update
	$(MAKE) -C vim/ update


variables:
	@echo "Force: $(FORCE)"
	@echo "Repo:  $(REPO)"
	@echo "Powerline root: $(POWER_ROOT)"
