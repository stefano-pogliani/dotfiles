.PHONY: render symlinks unlink unrender

BASHRC = $(HOME)/.bashrc

# "Internal" targets.
bashrc: templates/bashrc
	cat templates/bashrc | \
		REPO_PATH="$(REPO)" envsubst '$${REPO_PATH}' \
		> bashrc

# Top-level targets.
render: bashrc

symlinks:
	ln $(force_symlinks) -s "$(REPO)/bash/bashrc" "$(BASHRC)"

unlink:
	[ -L "$(BASHRC)" -o "$(FORCE)" == "yes" ] && rm -f "$(BASHRC)"

unrender:
	rm bashrc
