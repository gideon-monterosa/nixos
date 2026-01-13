{pkgs, ...}: {
  home.packages = [
    (pkgs.zathura.override {
      useMupdf = true;
    })
  ];

  xdg.configFile."zathura/zathurarc".text = ''
    # Auto-reload when file changes (default is true, but making it explicit)
    set recolor-keephue true
  '';

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
  };
}
