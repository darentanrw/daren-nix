# daren-nix

Small personal Nix configuration for macOS, built around `nix-darwin`, Home Manager, and flake-parts.

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
