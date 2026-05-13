{ ... }:

{
  flake.modules.darwin.node =
    { pkgs, ... }:
    {
      home-manager.users.daren = {
        home.packages = with pkgs; [
          biome
          bun
          nodejs_24
          pnpm
          yarn
        ];

        home.sessionVariables = {
          PNPM_HOME = "$HOME/.local/share/pnpm";
        };

        home.sessionPath = [
          "$HOME/.local/share/pnpm"
        ];
      };
    };
}
