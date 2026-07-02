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

## Transparency

The dark theme (`chalk`) uses a transparent editor background (`background =
"none"` in `lua/theme/themes/chalk.lua`) so the terminal's own background
opacity shows through. This is intended to be paired with a terminal configured
for a translucent window — for example WezTerm's `window_background_opacity`.

Because the background is transparent, highlights that **fill** a large region
(floating windows, folds, etc.) should reference `colors.background` (which
resolves to `"none"` in this theme) rather than an opaque colour — filling with
an opaque colour punches a solid box through the transparency, which looks
jarring over a translucent window.

The one deliberate exception is the sticky outer-scope banner
(`treesitter-context`): a transparent banner lets the scrolling code bleed
through it, and an underline separator instead picks up the syntax colours of
the code above it. So the banner uses a *subtle* solid fill —
`context_background`, a touch lighter than the base background and tinted toward
the theme's greens — to set itself apart with minimal visual weight. Keep any
such intentional fills subtle and close to the base background.

`chalk` is the only theme; light-mode switching was removed.

## Lean

The Lean language server is not a Mason package — it ships with the Lean
toolchain, which is managed by [`elan`](https://github.com/leanprover/elan)
(Lean's rustup-style version manager). The `lean.nvim` plugin spec bootstraps
this automatically: on plugin install/update its `build` step installs `elan`
and a default `stable` toolchain if `elan` isn't already on your `PATH`, and
`~/.elan/bin` is added to Neovim's `PATH` so the server is discoverable. The
first time you open a Lean project, `elan` downloads the toolchain version
pinned in that project's `lean-toolchain` file, which can take a minute.

Requires `curl` and network access at install time. To trigger the install
manually, run `:Lazy build lean.nvim`.

## Screenshots

<img width="1470" alt="Screenshot 2024-11-04 at 5 32 57 PM" src="https://github.com/user-attachments/assets/5c3477fe-22ba-40b5-85c7-5f8523dbb79e">
<img width="1470" alt="Screenshot 2024-11-04 at 5 33 33 PM" src="https://github.com/user-attachments/assets/342f36a6-e16f-4201-aac3-9d0005a97e9b">
<img width="1470" alt="Screenshot 2024-11-04 at 5 33 56 PM" src="https://github.com/user-attachments/assets/8b49a4e5-b26a-41e3-8177-27ef5c8d71c7">
