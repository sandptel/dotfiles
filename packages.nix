{ config,inputs, pkgs, ... }:
{
services.fprintd.enable = true;
# services.fprintd.tod.enable = true;
# services.fprintd.tod.driver = pkgs.libfprint;
services.flatpak.enable = true;
  users.users.roronoa = {
    isNormalUser = true;
    description = "roronoa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
figma-linux
wl-clipboard
spotify
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
