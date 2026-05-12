{ ... }:

{
  flake.modules.darwin.zsh =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;

      home-manager.users.daren = {
        home.file.".p10k.zsh".source = ./p10k.zsh;

        home.packages = with pkgs; [
          zsh
        ];

        programs.zsh = {
          enable = true;

          oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
            theme = "";
          };

          plugins = [
            {
              name = "powerlevel10k";
              src = pkgs.zsh-powerlevel10k;
              file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
          ];

          shellAliases = {
            ls = "eza --icons=always";
            ll = "eza --icons=always -l";
            la = "eza --icons=always -la";
            tree = "eza --icons=always --tree";
            grep = "rg --color=auto";
            find = "fd --color=auto";
          };

          initContent = ''
            unset NO_COLOR
            export CLICOLOR=1
            export COLORTERM=truecolor
            export GPG_TTY="$(tty)"

            [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
          '';
        };
      };
    };
}
