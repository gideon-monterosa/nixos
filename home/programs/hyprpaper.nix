{ assets, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${assets.wallpaper}" ];
      wallpaper = [ ",${assets.wallpaper}" ];
    };
  };
}
