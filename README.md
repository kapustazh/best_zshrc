# best_zshrc

Good ZSH configuration for 42 students.

This `.zshrc` is focused on fast daily workflow at 42: compiling C projects, checking memory leaks, jumping between repos, and keeping useful git/make shortcuts ready.

## Included Features

- Powerlevel10k prompt setup.
- Fast C compile+run helper: `cr file.c`.
- Valgrind helper with leak checks: `vg ./program args...`.
- Git aliases (`ga`, `gaa`, `gc`, `gst`, `gp`, `gr`, `gl`).
- Make aliases (`all`, `clean`, `fclean`, `re`).
- Optional tool integrations if installed: `zoxide`, `fzf`, `zsh-autosuggestions`, `zsh-syntax-highlighting`.

## Quick Install

1. Backup your current shell config:
	`cp ~/.zshrc ~/.zshrc.backup`
2. Copy this project config:
	`cp .zshrc ~/.zshrc`
3. Apply changes & Restart shell:
	`source ~/.zshrc`

## Notes for 42 Students

- The `cr` function uses strict flags (`-Wall -Wextra -Werror`) by default.
- Plugin loading is guarded, so your shell still starts even if optional tools are missing.
- `zsh-syntax-highlighting` is loaded last, as recommended.
