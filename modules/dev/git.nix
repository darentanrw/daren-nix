{ ... }:

{
  flake.modules.darwin.git =
    { pkgs, ... }:
    {
      home-manager.users.daren = {
        # gh comes from programs.gh (gh.nix); listing it here too collides on bin/gh
        home.packages = with pkgs; [
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
