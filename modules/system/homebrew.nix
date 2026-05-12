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
          "ngrok"
          "warp"
        ];
      };
    };
}
