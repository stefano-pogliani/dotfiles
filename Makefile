.DEFAULT_GOAL: install
.PHONY: build clean help install uninstall update variables


export FORCE = no
export REPO ?= $(CURDIR)


build:
	$(MAKE) -C bash/ build
	$(MAKE) -C vim/  build


clean:
	$(MAKE) -C bash/ clean
	$(MAKE) -C vim/  clean


help:
	@cat help.txt


install:
	$(MAKE) -C bash/ install
	$(MAKE) -C vim/  install


uninstall:
	$(MAKE) -C bash/ uninstall
	$(MAKE) -C vim/  uninstall


update:
	$(MAKE) -C vim/ update


variables:
	@echo "Force: $(FORCE)"
	@echo "Repo:  $(REPO)"
