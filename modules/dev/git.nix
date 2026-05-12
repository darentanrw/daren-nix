{ ... }:

{
  flake.modules.darwin.git =
    { pkgs, ... }:
    {
      home-manager.users.daren = {
        home.packages = with pkgs; [
          gh
          gnupg
        ];

        programs.git = {
          enable = true;

          settings = {
            user = {
              name = "Daren Tan";
              email = "daren28@gmail.com";
              signingKey = "87801ACF6DA1D448";
            };

            commit.gpgSign = true;
            tag.gpgSign = true;

            gpg.program = "gpg";
            init.defaultBranch = "main";

            credential."https://github.com".helper = [
              ""
              "!gh auth git-credential"
            ];

            credential."https://gist.github.com".helper = [
              ""
              "!gh auth git-credential"
            ];
          };
        };
      };
    };
}
