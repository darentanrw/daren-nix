# daren-nix

Small personal Nix configuration for macOS, built around `nix-darwin`, Home Manager, and flake-parts.

## Quickstart (new Mac)

```sh
# 1. Command Line Tools (provides git)
xcode-select --install

# 2. Determinate Nix, then open a new terminal so `nix` is on PATH
curl -fsSL https://install.determinate.systems/nix | sh -s -- install

# 3. Clone this repo
git clone https://github.com/darentanrw/daren-nix.git ~/daren-nix
cd ~/daren-nix

# 4. First apply (pick a host below; prompts for sudo)
nix develop -c apply-nix-darwin-configuration daren-work-aarch64-darwin
```

| Host                        | Machine                                          |
| --------------------------- | ------------------------------------------------ |
| `daren-aarch64-darwin`      | Personal (the default when no host is passed)    |
| `daren-work-aarch64-darwin` | Work: adds work Homebrew packages and Dock setup |

Open a new terminal after the first apply to pick up the managed shell. After that:

- Run `direnv allow` once in `~/daren-nix`. From then on `apply-nix-darwin-configuration <host>` is on PATH inside the repo, so `nix develop` isn't needed.
- Run `gh auth login` to sign in to GitHub.

If activation stops with `Unexpected files in /etc`, move the listed files aside and apply again:

```sh
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
```

## File Structure

```text
.
├── flake.nix          # Flake inputs and top-level module loading
├── flake.lock         # Locked dependency versions
├── modules/
│   ├── core.nix       # Shared core config
│   ├── hosts/         # Machine-specific nix-darwin configs
│   ├── system/        # macOS system, Homebrew, and Determinate setup
│   ├── users/         # User account and Home Manager config
│   ├── dev/           # Developer tools like git, GitHub CLI, and shell CLIs
│   ├── shell/         # Shell setup: zsh, direnv, atuin, zoxide, prompt
│   └── network/       # Network-related config such as SSH
└── result             # Local build output symlink, when present
```

## Notes

The flake imports the `modules/` tree with `import-tree`, so new module files can be added under the right folder and picked up by the flake structure.
