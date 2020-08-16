.PHONY: install render symlinks uninstall unlink unrender update

TMUX_CONF = $(HOME)/.tmux.conf

# "Internal" targets.
tmux.conf: templates/tmux.conf
	cat templates/tmux.conf | \
		REPO_PATH="$(REPO)" envsubst '$${REPO_PATH}' \
		> tmux.conf

# Top-level targets.
install:
	extentions/tpm/bin/install_plugins

render: tmux.conf

symlinks:
	ln $(force_symlinks) -s "$(REPO)/tmux/tmux.conf" "$(TMUX_CONF)"

uninstall:
	extentions/tpm/bin/clean_plugins

unlink:
	[ -L "$(TMUX_CONF)" -o "$(FORCE)" == "yes" ] && rm -f "$(TMUX_CONF)"

unrender:
	rm tmux.conf

update:
	extentions/tpm/bin/update_plugins all
