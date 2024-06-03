{ config,inputs, pkgs, ... }:
{

services.flatpak.enable = true;
  users.users.roronoa = {
    isNormalUser = true;
    description = "roronoa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      vim
      git
      vscode
      obs-studio	
rustup
gcc
glib     
clipcat 
google-chrome
      vlc
      hello
      android-studio
      telegram-desktop
      discord
      gtk-engine-murrine
      gnome.gnome-themes-extra 
      gnomeExtensions.pano
      libnotify
      github-desktop
      #inputs.wasmedge.packages."${pkgs.system}".wasmedge
      
    #  thunderbird
    ];
  };
}
