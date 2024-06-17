{ config,inputs, pkgs, ... }:
{
services.flatpak.enable = true;
  users.users.roronoa = {
    isNormalUser = true;
    description = "roronoa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ 
zed-editor
neofetch
firefox
vim
git
vscode
rustup
google-chrome
vlc
gnomeExtensions.pano
github-desktop
    ];
  };
}
