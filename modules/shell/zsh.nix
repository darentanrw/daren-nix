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

            # Readily dev-stack terminal title. Keeps the color cue in the Ghostty
            # tab even after the prompt scrolls off. Registered after oh-my-zsh's
            # title hook (this initContent is sourced later), so it overrides only
            # inside a Readily checkout and leaves omz's normal cwd title elsewhere.
            _readily_title_precmd() {
              local dir=$PWD envf=
              while true; do
                if [[ -r $dir/.devcontainer/.env ]]; then envf=$dir/.devcontainer/.env; break; fi
                [[ $dir == / ]] && break
                dir=''${dir:h}
              done
              [[ -n $envf ]] || return

              local color= port= line
              while IFS= read -r line; do
                case $line in
                  READILY_COLOR=*) color=''${line#READILY_COLOR=} ;;
                  POSTGRES_PORT=*) port=''${line#POSTGRES_PORT=} ;;
                esac
              done < $envf
              [[ -n $color ]] || return

              local dot
              case $color in
                blue)          dot=$'\U1F7E6' ;;
                green)         dot=$'\U1F7E9' ;;
                orange)        dot=$'\U1F7E7' ;;
                red)           dot=$'\U1F7E5' ;;
                yellow)        dot=$'\U1F7E8' ;;
                purple|violet) dot=$'\U1F7EA' ;;
                *)             dot=$'\U2B1B' ;;
              esac
              print -rn -- $'\e]0;'"''${dot} ''${(U)color}''${port:+ :$port} · ''${dir:t}"$'\a'
            }
            autoload -Uz add-zsh-hook
            add-zsh-hook precmd _readily_title_precmd

            [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
          '';
        };
      };
    };
}
