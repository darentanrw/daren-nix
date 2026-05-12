{ ... }:

{
  flake.modules.darwin.ssh = {
    home-manager.users.daren = {
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;

        matchBlocks = {
          "*" = {
            addKeysToAgent = "no";
            compression = false;
            controlMaster = "no";
            controlPath = "~/.ssh/master-%r@%n:%p";
            controlPersist = "no";
            forwardAgent = false;
            hashKnownHosts = false;
            serverAliveCountMax = 3;
            serverAliveInterval = 0;
            userKnownHostsFile = "~/.ssh/known_hosts";
          };

          "2030" = {
            hostname = "pe112.comp.nus.edu.sg";
            user = "darentan";
          };

          "daren-fast" = {
            hostname = "103.149.46.28";
            user = "daren";
            identityFile = "~/.ssh/daren-fast";
          };

          "daren-docker" = {
            hostname = "152.42.224.26";
            user = "daren";
            identityFile = "~/.ssh/id_ed25519";
          };

          "daren-do-2" = {
            hostname = "159.65.13.35";
            user = "daren";
            identityFile = "~/.ssh/DO-workshop";
          };

          "daren-do-3" = {
            hostname = "178.128.96.55";
            user = "daren";
            identityFile = "~/.ssh/do-3";
          };
        };
      };
    };
  };
}
