{ config,inputs, pkgs, ... }:
{

services.flatpak.enable = true;
  users.users.roronoa = {
    isNormalUser = true;
    description = "roronoa";
    extraGroups = [ "networkmanager" "wheel" ];

    
    packages = with pkgs; [
      
      #inputs.wasmedge.packages."${pkgs.system}".wasmedge
      
    #  thunderbird
    ];
  };
}
