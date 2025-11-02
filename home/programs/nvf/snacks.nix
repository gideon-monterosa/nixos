{
  vim = {
    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        picker = {
          enable = true;
          previewers = {
            diff = {
              builtin = false;
              cmd = ["delta"];
            };
            git = {
              builtin = false;
              args = ["-c" "delta.line-numbers=false"];
            };
          };
        };

        scroll = {
          enable = true;
          animate = {
            duration = {
              step = 25;
              total = 100;
            };
          };
        };
      };
    };
  };
}
