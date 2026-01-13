{pkgs, ...}: {
  home.packages = [pkgs.delta];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Gideon Monterosa";
        email = "gideon.monterosa@gmail.com";
      };

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
