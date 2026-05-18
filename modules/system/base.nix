{ ... }:

{
  flake.modules.darwin.base =
    { username, ... }:
    {
      time.timeZone = "America/Los_Angeles";
 

      system.stateVersion = 1;

      users.users.${username} = {
        name = username;
        home = "/Users/${username}";
      };

      system.defaults = {
        NSGlobalDomain = {
          AppleInterfaceStyleSwitchesAutomatically = true;
          AppleShowAllExtensions = true;
          ApplePressAndHoldEnabled = false;
          InitialKeyRepeat = 10;
          KeyRepeat = 2;
        };

        CustomUserPreferences = {
          "NSGlobalDomain" = {
            AppleMiniaturizeOnDoubleClick = false;
          };
        };

        dock = {
          autohide = true;
          autohide-delay = 0.0;
          autohide-time-modifier = 0.5;
          tilesize = 52;
          magnification = true;
          largesize = 80;
          persistent-apps = [
            { app = "/System/Applications/Apps.app"; }
            { app = "/System/Applications/Notes.app"; }
            { app = "/Applications/Microsoft Excel.app"; }
            { app = "/Applications/Microsoft PowerPoint.app"; }
            { app = "/Applications/Microsoft Word.app"; }
            {
              spacer = {
                small = true;
              };
            }
            { app = "/Applications/DaVinci Resolve/DaVinci Resolve.app"; }
            { app = "/Applications/Adobe Lightroom Classic/Adobe Lightroom Classic.app"; }
            { app = "/Applications/Adobe Photoshop 2024/Adobe Photoshop 2024.app"; }
            { app = "/Applications/Adobe Premiere Pro 2024/Adobe Premiere Pro 2024.app"; }
            {
              spacer = {
                small = true;
              };
            }
            { app = "/Applications/Google Chrome.app"; }
            { app = "/Applications/Zen.app"; }
            { app = "/Applications/Ghostty.app"; }
            { app = "/Applications/GitKraken.app"; }
            { app = "/Applications/Cursor.app"; }
            { app = "/Applications/Codex.app"; }
            { app = "/Applications/Linear.app"; }
            { app = "/Applications/Notion.app"; }
            { app = "/Applications/Notion Calendar.app"; }
            {
              spacer = {
                small = true;
              };
            }
            { app = "/Applications/Spotify.app"; }
            { app = "/Applications/Discord.app"; }
            { app = "/Applications/Telegram.app"; }
            { app = "/Applications/WhatsApp.app"; }
          ];
        };

        finder = {
          ShowPathbar = true;
          ShowStatusBar = true;
          FXPreferredViewStyle = "Nlsv";
          ShowExternalHardDrivesOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
        };
      };

      security.pam.services.sudo_local.touchIdAuth = true;
    };
}
