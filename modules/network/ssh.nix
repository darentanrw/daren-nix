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

          "daren-fast" = {
            hostname = "103.149.46.28";
            user = "daren";
            identityFile = "~/.ssh/daren-fast";
          };

          "do-immich" = {
            hostname = "167.172.84.73";
            user = "daren";
            identityFile = "~/.ssh/do-immich";
          };
        };
      };
    };
  };
}
