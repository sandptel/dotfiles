{ config,inputs,catppuccin, pkgs, ... }:
{

  home.username = "roronoa";
  home.homeDirectory = "/home/roronoa";

wayland.windowManager.sway={
enable=true;
};

programs.swayr.enable=true;

home.file.".config/sway" = {
     source = ./sway/sway;
     recursive = true;   
     executable = true;  
};

home.file.".config/waybar" = {
     source = ./waybar;
     recursive = true;   
     executable = true;  
};
home.file.".config/ags" = {
     source = ./ags;
};

 gtk = {
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Mocha";
    };
    iconTheme.package = pkgs.catppuccin-icons;
    cursorTheme.size = 30;
  };

catppuccin.enable=true;
catppuccin.flavor = "mocha";
catppuccin.accent = "lavender";
gtk.catppuccin.enable =true;
gtk.catppuccin.gnomeShellTheme=true;
qt.enable=true;
qt.style.catppuccin.enable=true;

programs.firefox=
{
  enable=true;
  
};


programs.rofi = {
    enable = true;
    catppuccin.enable = true;
  };

programs.starship = {
    enable = true;
    catppuccin.enable = true;
    enableBashIntegration=true;
  };
programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
  };
programs.bash =
{
  enable=true;
  enableCompletion = true;
};
  

home.packages = with pkgs;[
bun
eza
catppuccin-gtk
catppuccin-qt5ct
catppuccin-cursors
hyprpaper
wofi
dunst
eww
pulseaudio
brightnessctl
playerctl
neofetch
bemenu
dmenu
swaylock
swayidle
i3status
i3lock
dex
firefox
vim
git
vscode
obs-studio	
rustup
gcc
glib     
clipcat 
waybar
ags
google-chrome
vlc
telegram-desktop
discord
gnomeExtensions.pano
libnotify
github-desktop
   
];

home.file.".images" = {
     source = ./.images;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};

home.file.".config/scripts" = {
     source = ./scripts;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};
home.file.".config/eww" = {
     source = ./eww;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
};

home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  
}
