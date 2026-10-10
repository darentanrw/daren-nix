{ ... }:

{
  flake.modules.darwin.workDock =
    { lib, username, ... }:
    {
      system.defaults.dock = {
        persistent-apps = lib.mkForce (
          [
            { app = "/System/Applications/Apps.app"; }
            { app = "/Applications/Microsoft OneNote.app"; }
            { app = "/Applications/Microsoft Excel.app"; }
            { app = "/System/Applications/Notes.app"; }
            { app = "/System/Applications/Passwords.app"; }
            { app = "/Applications/AWS VPN Client/AWS VPN Client.app"; }
            { app = "/Applications/Google Chrome Canary.app"; }
            { app = "/Applications/Google Chrome.app"; }
            { app = "/Applications/Ghostty.app"; }
            { app = "/Applications/cmux.app"; }
            { app = "/Applications/Sublime Text.app"; }
            { app = "/Applications/Cursor.app"; }
            { app = "/Applications/Visual Studio Code.app"; }
            { app = "/Applications/Claude.app"; }
            { app = "/Applications/ChatGPT.app"; }
            { app = "/Applications/Linear.app"; }
            { app = "/Applications/Slack.app"; }
            { app = "/Applications/Docker.app/Contents/MacOS/Docker Desktop.app"; }
          ]
          # the readily Mac's Dock leaves out the personal apps
          ++ lib.optionals (username != "readily") [
            { app = "/Applications/Telegram.app"; }
            { app = "/Applications/Spotify.app"; }
          ]
        );

        persistent-others = [
          "/Users/${username}/Downloads"
          "/Users/${username}/Desktop"
        ];

        # Bottom-right hot corner -> Quick Note
        wvous-br-corner = 14;
      };
    };
}
