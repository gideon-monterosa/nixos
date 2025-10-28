_:

{
  programs.git = {
    enable = true;
    userName = "Gideon Monterosa";
    userEmail = "gideon.monterosa@gmail.com";

    extraConfig = {
      core.editor = "nvim";
      color.ui = "auto";
      push.autoSetupRemote = true;
    };
  };
}
