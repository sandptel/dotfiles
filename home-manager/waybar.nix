{ inputs, pkgs, ... }:
{
  programs.waybar.enable=true;
  home.file.".config/waybar" = {
     source = ./waybar;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};
wayland.windowManager.hyprland.extraConfig = ''

'';
}  