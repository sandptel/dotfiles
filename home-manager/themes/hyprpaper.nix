{
  pkgs,
  lib,
  ...
}:
with lib; let
  theme = {
    name = "catppuccin-mocha"; # Run `nix-shell -p lutgen --command 'lutgen apply -p ""` to see supported color palettes
    wallpapers = ../.images;
  };

  wallpapers = filesystem.listFilesRecursive theme.wallpapers;

  wallpaperBashArray = "(\"${strings.concatStrings (strings.intersperse "\" \"" (map (wallpaper: "${wallpaper}") wallpapers))}\")";
  # wallpaperRandomizer = pkgs.writeShellScriptBin "wallpaperRandomizer" ''
  #   wallpapers=${wallpaperBashArray}
  #   rand=$[$RANDOM % ''${#wallpapers[@]}]
  #   wallpaper=''${wallpapers[$rand]}

  #   monitor=(`hyprctl monitors | grep Monitor | awk '{print $2}'`)
  #   hyprctl hyprpaper unload all
  #   hyprctl hyprpaper preload $wallpaper
  #   for m in ''${monitor[@]}; do
  #     hyprctl hyprpaper wallpaper "$m,$wallpaper"
  #   done
  # '';
in {
  home.packages = [ pkgs.hyprpaper];

  services.hyprpaper = {
    enable = true;
    package= pkgs.hyprpaper;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload =
    [ 
      "${toString wallpapers}"
    ];

    wallpaper = [
    "eDP-1,${toString wallpapers}"
    ];
    };
  };

}