{ ... }:

{
  flake.modules.darwin.base =
    { username, ... }:
    {
      time.timeZone = "Asia/Singapore";

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
