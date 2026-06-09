# Neovim Configuration

Custom neovim configuration adding IDE-like features

## Features
- Lazy package manager
- Custom light/dark color theme
- File explorer
- LSP support with autocompletion
- Treesitter syntax highlighting
- Global grep/find-and-replace

## Requirements
- Neovim >= v0.11.0

## Installation (macOS)

1. **Install Homebrew** (skip if already installed):
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Neovim and dependencies:**
   ```sh
   brew install neovim fd ripgrep tree-sitter node
   ```
   - `fd` — fast file finder (used by Telescope)
   - `ripgrep` — fast text search / live grep
   - `tree-sitter` — builds syntax-highlighting parsers
   - `node` — required by several language servers

3. **Install a Nerd Font** for icons, then set it as your terminal font:
   ```sh
   brew install --cask font-jetbrains-mono-nerd-font
   ```

4. **Clone this config** (back up any existing `~/.config/nvim` first):
   ```sh
   git clone https://github.com/fenghourun/nvim.git ~/.config/nvim
   ```

5. **Launch Neovim.** On first start, Lazy bootstraps itself and installs all
   plugins, and Mason automatically installs the configured language servers.
   Give it a minute to finish, then restart Neovim. (Run `:Mason` anytime to
   review or manage installed tools.)

## Screenshots

<img width="1470" alt="Screenshot 2024-11-04 at 5 32 57 PM" src="https://github.com/user-attachments/assets/5c3477fe-22ba-40b5-85c7-5f8523dbb79e">
<img width="1470" alt="Screenshot 2024-11-04 at 5 33 33 PM" src="https://github.com/user-attachments/assets/342f36a6-e16f-4201-aac3-9d0005a97e9b">
<img width="1470" alt="Screenshot 2024-11-04 at 5 33 56 PM" src="https://github.com/user-attachments/assets/8b49a4e5-b26a-41e3-8177-27ef5c8d71c7">
