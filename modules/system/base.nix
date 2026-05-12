{ ... }:

{
  flake.modules.darwin.base =
    { username, ... }:
    {
      system.stateVersion = 1;

      users.users.${username} = {
        name = username;
        home = "/Users/${username}";
      };
    };
}
