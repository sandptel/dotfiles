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
    
    hyprland.extraConfig= ''
      bind= Super SHIFT , down, exec, phcontrol volumedown
      bind= Super SHIFT , up, exec, phcontrol volumeup
      bind= Super SHIFT , right, exec, phcontrol next
      bind= Super SHIFT , left, exec, phcontrol previous
      bind= Super SHIFT , Space, exec, phcontrol play
      bind= Super SHIFT , B, exec, phcontrol bluetooth
      bind= Super SHIFT , H, exec, phcontrol hotspot
      '';
    #apparently this does not work cause the config is imported by home.file.....
  };
}