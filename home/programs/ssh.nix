_:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      # Example configuration - customize as needed
      "*" = {
        identityFile = "~/.ssh/id_ed25519";
        addKeysToAgent = "yes";
      };
    };
  };

  services.ssh-agent.enable = true;
}
