_: {
  programs.git = {
    enable = true;
    userName = "Gideon Monterosa";
    userEmail = "gideon.monterosa@gmail.com";

    extraConfig = {
      core.editor = "nvim";
      color.ui = "auto";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        line-numbers = true;
      };
    };
  };
}
