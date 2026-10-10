{ ... }:

{
  flake.modules.darwin.homebrew =
    { username, ... }:
    {
      nix-homebrew = {
        enable = true;
        user = username;
        autoMigrate = true;
      };

      homebrew = {
        enable = true;

        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };

        casks = [
          "betterdisplay"
          "bruno"
          "codex"
          "ghostty"
          "iterm2"
          "jordanbaird-ice"
          "tailscale-app"
          "cmux"
          "linearmouse"
          "claude-code@latest"
          "chatgpt"
          "cursor"
          "google-chrome"
          "raycast"
        ];
      };
    };
}
