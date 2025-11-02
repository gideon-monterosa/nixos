{
  vim = {
    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        picker.enable = true;

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

