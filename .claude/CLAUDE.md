# Dotfiles Repository

Personal dotfiles managed with chezmoi for cross-machine configuration.

## Repository Structure

This is a chezmoi source directory. Files here get deployed to the home directory.

**Naming conventions:**
- `dot_` prefix becomes `.` (e.g., `dot_gitconfig` -> `~/.gitconfig`)
- `private_` prefix marks files excluded from certain contexts
- Nested `private_` directories represent nested paths (e.g., `private_Library/private_Preferences/` -> `~/Library/Preferences/`)

**Key files:**
- `dot_zshrc`, `dot_zprofile`, `dot_zshenv` - Zsh shell configuration
- `dot_zpreztorc` - Zprezto framework settings
- `dot_p10k.zsh` - Powerlevel10k prompt theme
- `dot_gitconfig` - Git identity and aliases
- `dot_vimrc`, `dot_vim/` - Vim configuration and plugins
- `dot_config/homebrew/Brewfile` - Homebrew package declarations
- `dot_claude/` - Claude Code settings (deployed to `~/.claude/`)
- `private_Library/` - macOS application preferences (iTerm2, VS Code)

**Not managed by chezmoi (in .chezmoiignore):**
- README.md
- .claude/
- docs/
- docker-compose.yml

## Shell Environment

Uses zsh with:
- Zprezto framework
- Powerlevel10k theme
- zplug plugin manager
- mise for language version management

## Working with This Repo

**Apply changes to home directory:**
```
chezmoi apply
```

**Edit a managed file:**
```
chezmoi edit ~/.zshrc
```

**Add a new file to be managed:**
```
chezmoi add ~/.some-config
```

**See what would change:**
```
chezmoi diff
```

## Conventions

- Keep configurations minimal and portable across macOS and Linux
- Comment non-obvious settings
- Test changes on a clean machine when possible
- Binary plist files (like iTerm2 prefs) are harder to diff - consider exporting as XML when practical
