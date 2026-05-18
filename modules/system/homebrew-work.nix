{ ... }:

{
  flake.modules.darwin.workHomebrew = {
    homebrew.casks = [
      "cursor"
      "google-chrome"
      "linear"
      "notion"
      "slack"
      "codex"
      "ghostty"
      "jordanbaird-ice"
      "claude-code"
    ];
  };
}
