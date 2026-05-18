{ inputs, ... }:

let
  username = "daren";
  system = "aarch64-darwin";
in
{
  flake.darwinConfigurations."${username}-work-${system}" = inputs.nix-darwin.lib.darwinSystem {
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
      gh
      zsh
      atuin
      zoxide
      direnv
      cli
      node
      python
    ];
  };
}
