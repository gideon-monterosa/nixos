{
  pkgs,
  inputs,
  ...
}: let
  qs = inputs.quickshell.packages.${pkgs.system}.default; # TODO also have the config in the repo
in {
  home = {
    packages = [
      qs
      pkgs.kdePackages.qtdeclarative
      pkgs.manrope
    ];

    sessionVariables = {
      QMLLS_BUILD_DIRS = "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml/:${qs}/lib/qt-6/qml/";
    };
  };
}
