{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "roronoa";
  home.homeDirectory = "/home/roronoa";

wayland.windowManager.sway={
enable=true;
};

home.file.".config/sway" = {
     source = ./sway-dot/.config/sway;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};#for sway

home.file.".images" = {
     source = ./sway-dot/.images;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};
home.file.".config/waybar" = {
     source = ./sway-dot/waybar;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };

home.file.".config/wofi" = {
     source = ./sway-dot/.config/waybar;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };

home.packages = with pkgs; [
hyprpaper
rofi
wofi
dunst
alacritty
waybar
eww
pulseaudio
brightnessctl
playerctl
bemenu
#sway
dmenu
swaylock
swayidle
i3status
i3lock
dex
  ];

wayland.windowManager.hyprland.enable= true;
wayland.windowManager.hyprland.extraConfig = "./confs/hypr/hyprland.conf";

   home.file.".config/hypr" = {
     source = ./confs/hypr;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};

programs.swayr.enable=true;

   
 
 home.file.".config/rofi" = {
     source = ./confs/rofi;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };
   
   home.file.".config/wallpapers" = {
     source = ./confs/wallpapers;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };
   home.file.".config/dunst" = {
     source = ./confs/dunst;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };
   
   home.file.".config/alacritty" = {
     source = ./confs/alacritty;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };
  
  
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  
}
