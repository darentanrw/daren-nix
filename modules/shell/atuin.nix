{ ... }:

{
  flake.modules.darwin.atuin =
    { username, ... }:
    {
      home-manager.users.${username} = {
        programs.atuin = {
          enable = true;
          enableZshIntegration = true;

          settings = {
            enter_accept = true;
            inline_height = 40;
            show_preview = true;

            theme = {
              name = "default";
            };
          };
        };
      };
    };
}
