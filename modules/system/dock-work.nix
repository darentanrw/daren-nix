{ ... }:

{
  flake.modules.darwin.workDock =
    { lib, ... }:
    {
      system.defaults.dock.persistent-apps = lib.mkForce [
        { app = "/System/Applications/Apps.app"; }
        { app = "/System/Applications/Notes.app"; }
        {
          spacer = {
            small = true;
          };
        }
        { app = "/Applications/Google Chrome.app"; }
        { app = "/Applications/Ghostty.app"; }
        { app = "/Applications/Cursor.app"; }
        { app = "/Applications/Codex.app"; }
        { app = "/Applications/Linear.app"; }
        { app = "/Applications/Slack.app"; }
      ];
    };
}
