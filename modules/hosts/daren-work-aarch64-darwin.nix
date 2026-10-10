# daren-work-aarch64-darwin.nix is the configuration for the work macs. The same
# config is built once per macOS account name, since work machines don't always
# use `daren`: <username>-work-aarch64-darwin

{ inputs, lib, ... }:

let
  usernames = [
    "daren"
    "readily"
  ];
  system = "aarch64-darwin";

  mkWorkHost =
    username:
    inputs.nix-darwin.lib.darwinSystem {
      inherit system;

      specialArgs = {
        inherit username;
      };

      modules = with inputs.self.modules.darwin; [
        {
          nixpkgs.hostPlatform = system;
        }

        inputs.determinate.darwinModules.default
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew

        base
        determinateNixConfig
        homebrew
        workHomebrew
        workDock
        daren
        git
        gh
        zsh
        atuin
        zoxide
        direnv
        ssh
        cli
        node
        python
      ];
    };
in
{
  flake.darwinConfigurations = lib.listToAttrs (
    map (username: lib.nameValuePair "${username}-work-${system}" (mkWorkHost username)) usernames
  );
}
