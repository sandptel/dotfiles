# ./scripts.nix
#this is a module
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.phcontrol;
in {
  options.module.phcontrol = {
    enable = mkEnableOption "the phcontrol program";
  };

  config = mkIf cfg.enable {
    home.packages = [ (import ./phone.nix {inherit pkgs;}) ];
    # wayland.windowManager.sway.extraConfig= "bindsym Mod1+p exec ags -t mpris";
    #apparently this does not work cause the config is imported by home.file.....
  };
}