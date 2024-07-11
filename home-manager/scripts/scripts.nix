# ./scripts.nix
#this is a module
{ inputs,config, lib, pkgs, ... }:

with lib;

let
  cfg = config.module.phcontrol;
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in {
  options.module.phcontrol = {
    enable = mkEnableOption "the phcontrol program";
  };

  config = mkIf cfg.enable {
    home.packages = [ (import ./phone.nix {inherit pkgs;}) ];
    
    wayland.windowManager.hyprland.extraConfig= ''
      bind = Ctrl, Q, killactive,
      '';
    #apparently this does not work cause the config is imported by home.file.....
  };
}