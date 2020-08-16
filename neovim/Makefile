.PHONY: install render symlinks uninstall unlink unrender update

CONFPATH = $(HOME)/.config/nvim
INITRC = $(CONFPATH)/init.vim

# "Internal" targets.
$(CONFPATH):
	mkdir "$(CONFPATH)"

init.vim: templates/init.vim
	cat templates/init.vim | REPO_PATH="$(REPO)" envsubst '$${REPO_PATH}' > init.vim

# Top-level targets.
install:
	nvim +PlugInstall +UpdateRemotePlugins +qa

render: init.vim

symlinks: $(CONFPATH)
	ln $(force_symlinks) -s "$(REPO)/neovim/init.vim" "$(INITRC)"

uninstall:
	nvim +PlugClean +qa

unlink:
	[ -L "$(INITRC)" -o "$(FORCE)" == "yes" ] && rm -f "$(INITRC)"

unrender:
	rm init.vim

update:
	nvim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qa
