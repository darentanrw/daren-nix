{ ... }:

{
  flake.modules.darwin.homebrew =
    { username, ... }:
    {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
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
          "warp"
          "jordanbaird-ice"
          "tailscale-app"
          "cmux"
          "linearmouse"
          "claude-code@latest"
          "chatgpt"
        ];
      };
    };
}
