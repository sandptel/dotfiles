{ config,catppuccin, pkgs, ... }:

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


programs.rofi = {
    enable = true;
    catppuccin.enable = true;
  };

programs.starship = {
    enable = true;
    catppuccin.enable = true;
  };
programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
  };
programs.bash.bashrcExtra ="eval "$(starship init bash)"";  

home.packages = with pkgs;[
  bun
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


home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  
}
