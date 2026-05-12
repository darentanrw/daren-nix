{ inputs, lib, ... }:

{
  options.flake.modules = lib.mkOption {
    type = lib.types.lazyAttrsOf (lib.types.lazyAttrsOf lib.types.raw);
    default = { };
    description = "Dendritic modules grouped by target class.";
  };

  config = {
    systems = [ "aarch64-darwin" ];

    perSystem =
      { pkgs, system, ... }:
      {
        devShells.default = pkgs.mkShellNoCC {
          packages = [
            (pkgs.writeShellApplication {
              name = "apply-nix-darwin-configuration";
              runtimeInputs = [
                inputs.nix-darwin.packages.${system}.darwin-rebuild
              ];
              text = ''
                echo "> Applying nix-darwin configuration..."
                sudo darwin-rebuild switch --flake ".#daren-aarch64-darwin"
                echo "> macOS config was successfully applied"
              '';
            })

            pkgs.nixfmt
          ];
        };

        formatter = pkgs.writeShellApplication {
          name = "nixfmt-tree";
          runtimeInputs = [
            pkgs.fd
            pkgs.nixfmt
          ];
          text = ''
            if [ "$#" -eq 0 ]; then
              fd --extension nix --exec nixfmt
            else
              nixfmt "$@"
            fi
          '';
        };
      };
  };
}
