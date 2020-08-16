# VS Code customisation tasks

  1. Additional VS Code configuration:
     * Update sidebar keybindins to navigate to docker tab
       * Configure docker integration to work with podman? (`PROFILE=personal` only?)
       * At least stop it from suggesting install every time.
     * Improve autocomplete:
       * Other open files.
       * Dictionary words.
     * More plugins:
       * https://marketplace.visualstudio.com/items?itemName=jgclark.vscode-todo-highlight
       * https://marketplace.visualstudio.com/items?itemName=ms-python.python
       * (PROFILE=work) https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
     * Can I auto-complete text from other files?
     * Test things out and get used to it.
     * Settings: terminal fonts.
  2. MacOS support for dotfiles and adopt at work:
     1. Add a `MACOS=no` variable.
     2. When `PROFILE=work` set `MACOS=yes`.
     3. If a `.gitignore`d file exists default to `PROFILE=work` (or just load profile from it?).
     4. See notes for MacOS specific things and update makefiles.
     5. Create a set of bash aliases for `PROFILE=work` only.
     6. Create a list of VS Code plugins for `PROFILE=work` only.
     7. Create a MacOS.md with vague notes for installing and setting up MacOS.
  3. Add symlink to asfd `~/.tool-versions`? (if so move asfd out of bash?)
