{ ... }:

{
  flake.modules.darwin.python =
    { pkgs, ... }:
    {
      home-manager.users.daren = {
        home.packages = with pkgs; [
          python313
          ruff
          uv
        ];
      };
    };
}
