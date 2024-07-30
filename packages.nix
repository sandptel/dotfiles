{ config,inputs, pkgs, ... }:
{
services.flatpak.enable = true;
  users.users.roronoa = {
    isNormalUser = true;
    description = "roronoa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
figma-linux
wl-clipboard
grim
slurp
blueman
rofi-bluetooth
networkmanagerapplet  
flameshot
bun
eza
pulseaudio
brightnessctl
playerctl
neofetch
firefox
vim
git
vscode
# obs-studio	
rustup
gcc
glib     
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
