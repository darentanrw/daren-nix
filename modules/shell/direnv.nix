{ ... }:

{
  flake.modules.darwin.direnv = {
    home-manager.users.daren = {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}
