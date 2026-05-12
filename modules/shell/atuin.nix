{ ... }:

{
  flake.modules.darwin.atuin = {
    home-manager.users.daren = {
      programs.atuin = {
        enable = true;
        enableZshIntegration = true;

        settings = {
          enter_accept = true;
        };
      };
    };
  };
}
