{ ... }:

{
  flake.modules.darwin.workHomebrew = {
    homebrew.casks = [
      "cursor"
      "google-chrome"
      "linear"
      "notion"
      "slack"
      "vscode"
      "codex"
      "ghostty"
      "jordanbaird-ice"
      "claude-code"
    ];
  };
}
