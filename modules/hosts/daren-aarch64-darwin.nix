# daren-aarch64-darwin.nix is the configuration for the daren-aarch64-darwin host,
# choosing which features are active on that mac

{ inputs, ... }:

let
  username = "daren";
  system = "aarch64-darwin";
in
{
  flake.darwinConfigurations."${username}-${system}" = inputs.nix-darwin.lib.darwinSystem {
    inherit system;

    specialArgs = {
      inherit inputs username;
    };

    modules = with inputs.self.modules.darwin; [
      inputs.determinate.darwinModules.default
      inputs.home-manager.darwinModules.home-manager
      inputs.nix-homebrew.darwinModules.nix-homebrew

      base
      determinateNixConfig
      homebrew
      daren
      git
      gh
      zsh
      atuin
      zoxide
      direnv
      ssh
      cli
      python
    ];
  };
}
