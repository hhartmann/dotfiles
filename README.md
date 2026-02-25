# dotfiles

Persönliche Konfigurationsdateien (Dotfiles) für macOS — Terminal, Editor und Tools.
Dieses Repository ermöglicht es, den gesamten Setup auf einem neuen Rechner in Minuten wiederherzustellen.

---

## Enthaltene Konfigurationen

| Datei | Tool | Beschreibung |
|---|---|---|
| `zshrc` | Zsh | Oh-My-Zsh, Powerlevel10k, FZF, vi-mode |
| `bashrc` | Bash | Oh-My-Bash, Powerline-Theme |
| `vimrc` | Vim | vim-plug, ~15 Plugins, Leader=`,` |
| `tmux.conf` | Tmux | Prefix=`Ctrl+a`, TPM Plugins, Session-Restore |
| `rc.conf` | Ranger | Dateimanager mit Git-Integration |
| `Agent_UserConfiguration_2021-09-04.json` | UHK | Ultimate Hacking Keyboard (Colemak-Layout) |

---

## Ersteinrichtung auf einem neuen Mac

### Schritt 1 — Homebrew installieren

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Schritt 2 — Abhängigkeiten installieren

```bash
# Shell-Frameworks
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Zsh Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Tools
brew install fzf fd bat tree neofetch ranger
brew install --cask postgres

# Python virtualenvwrapper
pip3 install virtualenvwrapper

# Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Schritt 3 — Dotfiles klonen und verlinken

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
bash make-symlinks.sh
```

Das Skript sichert vorhandene Configs in `dotfiles_old/` und erstellt Symlinks:

```
~/dotfiles/bashrc  →  ~/.bashrc
~/dotfiles/zshrc   →  ~/.zshrc
~/dotfiles/vimrc   →  ~/.vimrc
```

### Schritt 4 — Tmux Plugins installieren

```bash
tmux
# Dann: Ctrl+a  dann  I  (Großbuchstabe)
# → installiert alle Plugins automatisch
```

### Schritt 5 — Vim Plugins installieren

Beim ersten Start von Vim werden alle Plugins automatisch installiert. Alternativ manuell:

```bash
vim +PlugInstall +qall
```

---

## Änderungen vornehmen

Da Symlinks eingerichtet sind, arbeitest du **direkt in den Dateien im Repo** — nicht in `~/.zshrc` o.ä. Änderungen sind sofort aktiv.

```bash
# Datei bearbeiten
vim ~/dotfiles/zshrc

# Shell neu laden
source ~/.zshrc

# Änderungen speichern
cd ~/dotfiles
git add zshrc
git commit -m "Add alias for docker"
git push
```

---

## Updates auf einem zweiten Rechner übernehmen

```bash
cd ~/dotfiles
git pull
source ~/.zshrc
```

---

## Wichtige Shortcuts

### Zsh / Terminal

| Shortcut | Aktion |
|---|---|
| `Ctrl+T` | Datei suchen (FZF) |
| `Alt+C` | Ordner wechseln (FZF) |
| `Ctrl+R` | Befehlshistorie durchsuchen (FZF) |
| `cmd \| Z` | Ausgabe durch FZF filtern |
| `ip` | Externe IP-Adresse anzeigen |
| `buu` | Homebrew updaten & upgraden |

### Vim (Leader = `,`)

| Shortcut | Aktion |
|---|---|
| `,e` | Datei öffnen (FZF) |
| `,b` | Buffer wechseln (FZF) |
| `,h` | Dateihistorie (FZF) |
| `,f` | NERDTree öffnen/schließen |
| `,w` / `,q` / `,wq` | Speichern / Beenden / Beides |
| `,gd` | Git Diff (Gvdiffsplit) |
| `,,` | Zwischen letzten Buffers wechseln |
| `,-` / `,/` | Horizontal / Vertikal teilen |
| `,y` / `,p` | In/aus Systemzwischenablage kopieren |
| `jk` | Insert-Mode verlassen (→ Normal-Mode) |

### Tmux (Prefix = `Ctrl+a`)

| Shortcut | Aktion |
|---|---|
| `Prefix + \|` | Pane vertikal teilen |
| `Prefix + -` | Pane horizontal teilen |
| `Ctrl+Pfeiltasten` | Zwischen Panes wechseln |
| `Prefix + r` | Konfiguration neu laden |
| `Prefix + I` | Plugins installieren |
| `Prefix + s` | Sessions anzeigen |

---

## Ältere Version wiederherstellen

```bash
git log --oneline          # Versionen anzeigen
git checkout <commit> zshrc  # Einzelne Datei zurücksetzen
git push
```

---

## Keyboard-Konfiguration

Konfiguration für das [Ultimate Hacking Keyboard](https://ultimatehackingkeyboard.com/) mit Keycluster- und Trackball-Modul.
Layout: Colemak, optimiert für macOS.
Die Konfigurationsdatei (`Agent_UserConfiguration_2021-09-04.json`) kann direkt im UHK Agent importiert werden.
