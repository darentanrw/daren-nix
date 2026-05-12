{ ... }:

{
  flake.modules.darwin.atuin = {
    home-manager.users.daren = {
      programs.atuin = {
        enable = true;
        enableZshIntegration = true;

        settings = {
          enter_accept = true;
          inline_height = 40;
          show_preview = true;
          style = "compact";

          theme = {
            name = "default";
          };
        };
      };
    };
  };
}
