_: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Gideon Monterosa";
        email = "gideon.monterosa@gmail.com";
      };
      core.editor = "nvim";
      color.ui = "auto";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      light = false;
      line-numbers = true;
      syntax-theme = "Visual Studio Dark+";
    };
  };
}
