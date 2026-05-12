{ ... }:

{
  flake.modules.darwin.daren =
    { username, ... }:
    {
      system.primaryUser = username;

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

      home-manager.users.${username} = {
        home.username = username;
        home.homeDirectory = "/Users/${username}";
        home.stateVersion = "25.11";
      };
    };
}
