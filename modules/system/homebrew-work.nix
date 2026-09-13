{ ... }:

{
  flake.modules.darwin.workHomebrew = {
    homebrew.casks = [
      "cursor"
      "google-chrome"
      "google-chrome@canary"
      "linearmouse"
      "raycast"
      "linear"
      "notion"
      "slack"
      "visual-studio-code"
      "t3-code"
      "codex"
      "codex-app"
      "ghostty"
      "jordanbaird-ice"
      "dbeaver-community"
      "cmux"
      "chatgpt"
      "claude-code@latest"
    ];
  };
}
