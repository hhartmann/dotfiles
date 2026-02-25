# CLAUDE.md — AI Assistant Guide for hhartmann/dotfiles

This file provides context for AI assistants (like Claude) working in this repository.

## Repository Overview

Personal dotfiles repository for a macOS developer workstation, primarily featuring terminal and editor configuration. The configs are optimized for a power-user workflow using an Ultimate Hacking Keyboard (UHK) with a Colemak layout.

**Platform**: macOS (paths reference `/Users/holger.hartmann/` and `/Users/Holger/`)
**Shell**: Zsh (primary), Bash (secondary)
**Editor**: Vim with vim-plug plugins

---

## Repository Structure

```
dotfiles/
├── bashrc                               # Bash shell config (Oh-My-Bash + Powerline)
├── zshrc                                # Zsh shell config (Oh-My-Zsh + Powerlevel10k + FZF)
├── vimrc                                # Vim config (vim-plug, ~15 plugins, leader=,)
├── tmux.conf                            # Tmux config (prefix=C-a, TPM plugins)
├── rc.conf                              # Ranger file manager config (24KB, extensive keybindings)
├── make-symlinks.sh                     # Install script: backs up existing dotfiles, creates symlinks
├── README.md                            # Brief overview and manual symlink instructions
├── Agent_UserConfiguration_2021-09-04.json  # UHK keyboard hardware config (Colemak layout)
└── dotfiles_old/                        # Backup of previous config versions
```

**Note**: Files are stored **without** a leading dot in the repo (e.g., `bashrc`, not `.bashrc`). The install script adds the dot prefix when symlinking into `~`.

---

## Key Conventions

### File Naming
- Config files live at the repo root without a leading dot
- Symlinks in `~` use the standard dotfile convention (`~/.bashrc`, `~/.vimrc`, etc.)

### Installation
The `make-symlinks.sh` script is the canonical install method:
1. Backs up existing dotfiles to `~/github/dotfiles/dotfiles_old/`
2. Creates symlinks: `~/dotfiles/bashrc` → `~/.bashrc`, etc.

Manual alternative (from README):
```bash
ls -s ~/dotfiles/.bashrc ~/.bashrc
ls -s ~/dotfiles/.vimrc ~/.vimrc
ls -s ~/dotfiles/.zshrc ~/.zshrc
```

---

## Configuration Details

### zshrc
- Framework: [Oh-My-Zsh](https://ohmyz.sh/) at `/Users/Holger/.oh-my-zsh`
- Theme: Powerlevel10k with instant prompt enabled
- Plugins: `git`, `fzf`, `zsh-autosuggestions`, `zsh-interactive-cd`, `zsh-syntax-highlighting`, `vi-mode`
- History: 32,768 lines
- Key aliases:
  - `Z` — pipe to fzf
  - `ip` — `curl icanhazip.com` (get external IP)
- FZF options: reverse layout, 60% height, multi-select, file previews via `bat`/`tree`

### bashrc
- Framework: [Oh-My-Bash](https://github.com/ohmybash/oh-my-bash) at `/Users/holger.hartmann/.oh-my-bash`
- Theme: Powerline
- Plugins: `git`, `bashmarks`, `progress`
- Key aliases: `buu` = `brew update && brew upgrade`
- Python: virtualenvwrapper for Python 3.5 and 3.8

### vimrc
- Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug) (auto-installs on first launch)
- **Leader key**: `,` (comma)
- Key plugins: Coc.nvim (LSP), FZF, NERDTree, vim-airline, vim-fugitive, vim-gitgutter, EasyMotion
- Tab width: 2 spaces, UTF-8, relative+absolute line numbers, dark background
- GitLab integration via vim-fugitive-gitlab (remote: `gitlab.bepartners.pro`)
- Key mappings:
  - `,w` / `,q` / `,wq` — save/quit
  - `,f` — NERDTree toggle
  - `,b` / `,e` / `,h` — FZF buffers/files/history
  - `gd` — Git diff

### tmux.conf
- Prefix: `C-a` (remapped from default `C-b`)
- Pane splits: `|` (vertical), `-` (horizontal)
- Vi-mode copy with clipboard integration
- Plugins (TPM): `tmux-sensible`, `tmux-resurrect` (session persistence), `tmux-continuum` (auto-restore)
- Status bar: shows local IP, VPN IP, session name, date/time
- Window numbering starts at 1

### rc.conf (Ranger)
- View: Miller columns, image previews via iTerm2 protocol
- Git VCS awareness enabled
- Sorting: natural, case-insensitive, directories first
- Relative line numbers with absolute on current line
- Extensive custom keybindings (Vim-style + Midnight Commander F-keys)

---

## Development Workflow

### Making Changes
1. Edit the relevant config file directly (e.g., `vimrc`, `zshrc`)
2. Commit with a descriptive message following the existing pattern:
   - `Updated vimrc` / `Update zshrc` / `Update README.md`
3. The symlink setup means changes in the repo are immediately live on the developer's machine

### Git Practices
- Branch naming: feature branches use `claude/<description>-<id>` for AI-generated changes
- Commits are typically small, single-file updates
- No CI/CD pipelines — this is a personal config repo
- Remote uses a local proxy: `http://local_proxy@127.0.0.1:51914/git/hhartmann/dotfiles`

### Adding New Tools
When adding a new tool's configuration:
1. Create the config file at the repo root (without leading dot)
2. Add a symlink entry to `make-symlinks.sh`
3. Document dependencies (frameworks, package managers) in `README.md`

---

## Dependencies

Tools expected to be pre-installed on the target machine:

| Tool | Used By |
|------|---------|
| Oh-My-Zsh | zshrc |
| Oh-My-Bash | bashrc |
| Powerlevel10k | zshrc |
| FZF | zshrc, vimrc |
| bat | zshrc (file previews) |
| tree | zshrc (directory previews) |
| neofetch | bashrc |
| vim-plug | vimrc (auto-installs) |
| TPM (Tmux Plugin Manager) | tmux.conf |
| Ranger | rc.conf |
| virtualenvwrapper | bashrc, zshrc |
| Homebrew | general macOS package management |

---

## What NOT to Do

- Do not add a leading dot to filenames in this repo — the convention is dot-free names at the root
- Do not modify `dotfiles_old/` — it is a backup directory only
- Do not add CI/CD or test infrastructure — this is a personal config repo with no automated testing
- Do not restructure into subdirectories — the flat root structure is intentional
- The `Agent_UserConfiguration_2021-09-04.json` file is a hardware keyboard config; edit only if explicitly asked to modify UHK settings
