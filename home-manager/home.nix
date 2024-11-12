{ config,lib,inputs,catppuccin, pkgs, ... }:
{
  home.username = "roronoa";
  home.homeDirectory = "/home/roronoa";
  home.enableNixpkgsReleaseCheck = false;

imports=[./ags.nix
./waybar.nix
./glacier.nix
./themes/theme.nix
./scripts/scripts.nix
# ./eww/eww.nix
./ags.nix
./starship.nix
./hypr.nix
./hyprlock.nix

inputs.nix-colors.homeManagerModules.default
];

wayland.windowManager.hyprland.enable=true;
 
module.phcontrol.enable=true;

programs.kitty={
  enable = true;
  extraConfig = ''
  font_size 14
  background_opacity 0.2
  '';
};

programs.bash.enable=true;
programs.fish.enable=true;
# programs.starship = {
#     enable = true;
#     # catppuccin.enable = true;
#     enableBashIntegration=true;
#   };
programs.firefox.enable=true;
programs.fuzzel.enable=true;
home.file.".config/fuzzel" = {
     source = ./fuzzel;
     recursive = true;   
     executable = true;  
};



home.packages = with pkgs;[
# airshipper
wl-clipboard
hyprlock
];

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

}  