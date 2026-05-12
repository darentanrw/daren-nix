{ ... }:

{
  flake.modules.darwin.gh = {
    home-manager.users.daren = {
      programs.gh = {
        enable = true;

        settings = {
          git_protocol = "https";
          prompt = "enabled";

          aliases = {
            co = "pr checkout";
          };
        };
      };
    };
  };
}
