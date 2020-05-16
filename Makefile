.DEFAULT_GOAL := install
.PHONY: build clean help install uninstall update variables


export FORCE = no
export REPO ?= $(CURDIR)


build:
	$(MAKE) -C bash/ build
	$(MAKE) -C neovim/ build
	$(MAKE) -C starship/ build
	$(MAKE) -C term/ build
	$(MAKE) -C tmux/ build


clean:
	$(MAKE) -C bash/ clean
	$(MAKE) -C neovim/ clean
	$(MAKE) -C starship/ clean
	$(MAKE) -C term/ clean
	$(MAKE) -C tmux/ clean


help:
	@cat help.txt


install:
	$(MAKE) -C bash/ install
	$(MAKE) -C neovim/ install
	$(MAKE) -C starship/ install
	$(MAKE) -C term/ install
	$(MAKE) -C tmux/ install


reinstall: uninstall clean install


uninstall:
	$(MAKE) -C bash/ uninstall
	$(MAKE) -C neovim/ uninstall
	$(MAKE) -C starship/ uninstall
	$(MAKE) -C term/ uninstall
	$(MAKE) -C tmux/ uninstall


update:
	git submodule update --remote
	nvim +PlugInstall +UpdateRemotePlugins +PlugUpdate +qa
	tmux/extentions/tpm/bin/update_plugins all


variables:
	@echo "Force: $(FORCE)"
	@echo "Repo:  $(REPO)"
