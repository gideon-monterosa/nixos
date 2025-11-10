{pkgs, ...}: {
  home.packages = [pkgs.delta];

  programs.git = {
    enable = true;
    userName = "Gideon Monterosa";
    userEmail = "gideon.monterosa@gmail.com";

    extraConfig = {
      core = {
        editor = "nvim";
        pager = "delta";
      };
      color.ui = "auto";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";

      interactive.diffFilter = "delta --color-only";

      delta = {
        navigate = true;
        light = false;
        line-numbers = true;
        syntax-theme = "Visual Studio Dark+";
      };
    };
  };
}
