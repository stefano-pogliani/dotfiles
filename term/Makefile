.PHONY: install uninstall

# Top-level targets.
install:
	gnome/theme-nord/src/nord.sh
	@echo "--> Don't forget to update the terminal current and default theme"

	curl --location --output /tmp/DroidSansMono.zip \
		https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/DroidSansMono.zip
	unzip -q -o -d /tmp/DroidSansMono /tmp/DroidSansMono.zip

	mkdir ~/.local/share/fonts/
	cp /tmp/DroidSansMono/DroidSansMNerdFont*.otf ~/.local/share/fonts/
	fc-cache -f

uninstall:
	@echo "--> 1. Set a new current and default theme"
	@echo "--> 2. Delete the nord theme from your terminal"
	@read -p 'Done? '

	rm -f ~/.local/share/fonts/DroidSansMNerdFont*.otf
	fc-cache -v
