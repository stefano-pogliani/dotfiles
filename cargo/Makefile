.PHONY: install uninstall update packages_list

# "Internal" targets.
packages_list:
	cat packages.all.txt > packages.txt
	if [ -e packages.$(PROFILE).txt ]; then cat packages.$(PROFILE).txt >> packages.txt; fi

# Top-level targets.
uninstall: packages_list
	cat packages.txt | xargs -L1 cargo uninstall

update: packages_list
	cat packages.txt | xargs -L1 cargo install
