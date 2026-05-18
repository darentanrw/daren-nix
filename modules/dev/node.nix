{ ... }:

{
  flake.modules.darwin.node =
    { lib, pkgs, ... }:
    {
      home-manager.users.daren =
        { config, ... }:
        let
          pnpmHome = "${config.home.homeDirectory}/.local/share/pnpm";
        in
        {
          home.packages = with pkgs; [
            biome
            bun
            nodejs_24
            pnpm
            yarn
          ];

          home.sessionVariables = {
            PNPM_HOME = pnpmHome;
          };

          home.sessionPath = [
            pnpmHome
          ];

          home.file."Library/Preferences/pnpm/rc".text = ''
            global-bin-dir=${pnpmHome}
          '';

          programs.zsh.initContent = lib.mkBefore ''
            export PNPM_HOME=${lib.escapeShellArg pnpmHome}
            path=("$PNPM_HOME" $path)
          '';
        };
    };
}
