{ inputs, ... }:

{
  flake.modules.darwin.gh =
    { pkgs, username, ... }:
    {
      home-manager.users.${username} = {
        programs.gh = {
          enable = true;
          package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.gh;

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
