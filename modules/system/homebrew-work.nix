{ ... }:

{
  flake.modules.darwin.workHomebrew = {
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
    ];
  };
}
