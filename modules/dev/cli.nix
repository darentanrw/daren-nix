{ ... }:

{
  flake.modules.darwin.cli =
    { pkgs, username, ... }:
    {
      home-manager.users.${username} = {
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
