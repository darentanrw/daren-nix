{ ... }:

{
  flake.modules.darwin.determinateNixConfig = {
    determinateNix = {
      enable = true;

      customSettings = {
        eval-cores = 0;
        extra-experimental-features = [
          "build-time-fetch-tree"
        ];
      };
    };
  };
}
