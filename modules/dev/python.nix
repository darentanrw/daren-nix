{ ... }:

{
  flake.modules.darwin.python =
    { pkgs, username, ... }:
    {
      home-manager.users.${username} = {
        home.packages = with pkgs; [
          python313
          ruff
          uv
        ];
      };
    };
}
