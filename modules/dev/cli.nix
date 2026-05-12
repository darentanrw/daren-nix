{ ... }:

{
  flake.modules.darwin.cli =
    { pkgs, ... }:
    {
      home-manager.users.daren = {
        home.packages = with pkgs; [
          btop
          curl
          eza
          fd
          ripgrep
          wget
        ];
      };
    };
}
