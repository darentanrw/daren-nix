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
      };
    };
}
