{ config,inputs, pkgs, ... }:
{
services.flatpak.enable = true;
  users.users.roronoa = {
    isNormalUser = true;
    description = "roronoa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
kitty
wl-clipboard
grim
slurp
blueman
rofi-bluetooth
networkmanagerapplet  
flameshot
bun
eza
hyprpaper
wofi
dunst
pulseaudio
brightnessctl
playerctl
neofetch
firefox
vim
git
vscode
obs-studio	
rustup
gcc
glib     
waybar
google-chrome
vlc
telegram-desktop
discord
gnomeExtensions.pano
libnotify
github-desktop
    ];
  };
}
