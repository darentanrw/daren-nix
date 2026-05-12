{ ... }:

{
  flake.modules.darwin.zoxide = {
    home-manager.users.daren = {
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
