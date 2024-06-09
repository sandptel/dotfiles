{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "roronoa";
  home.homeDirectory = "/home/roronoa";

wayland.windowManager.sway={
enable=true;
};

programs.swayr.enable=true;

home.file.".config/sway" = {
     source = ./sway;
     recursive = true;   
     executable = true;  
};

home.packages = with pkgs;[
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
dmenu
swaylock
swayidle
i3status
i3lock
dex
];


gtk={
  theme.name= "dracula";
  theme.package = [pkgs.dracula-theme];

};

home.file.".themes/dracula" = {
     source = ./dracula-gtk;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};

home.file.".images" = {
     source = ./.images;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};
home.file.".config/waybar" = {
     source = ./waybar;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };
home.file.".config/rofi" = {
     source = ./rofi;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };
   
home.file.".config/alacritty" = {
     source = ./alacritty;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
   };
  
  
home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  
}
