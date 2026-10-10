{ ... }:

{
  flake.modules.darwin.workHomebrew =
    { lib, username, ... }:
    {
      homebrew.brews = [
        "ffmpeg"
      ];

      homebrew.casks = [
        "google-chrome@canary"
        "linear"
        "notion"
        "slack"
        "visual-studio-code"
        "t3-code"
        "dbeaver-community"
      ]
      # the readily Mac starts clean; daren's work Mac already has these installed
      ++ lib.optionals (username == "readily") [
        "microsoft-onenote"
        "microsoft-excel"
        "aws-vpn-client"
        "claude"
        "docker-desktop"
        "sublime-text"
      ];
    };
}
