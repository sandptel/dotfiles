{ config,inputs, pkgs, ... }:
{
  programs.steam.enable=true;
  programs.steam.gamescopeSession.enable=true;
  environment.systemPackages = with pkgs;[
    mangohud
    protonup
    lutris
    wine
    playonlinux
  ];
  programs.gamemode.enable=true;

}