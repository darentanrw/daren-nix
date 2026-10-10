{ ... }:

{
  flake.modules.darwin.zoxide =
    { username, ... }:
    {
      home-manager.users.${username} = {
        programs.zoxide = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
}
