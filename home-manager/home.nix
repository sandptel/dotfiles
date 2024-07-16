{ config,lib,inputs,catppuccin, pkgs, ... }:
{
  home.username = "roronoa";
  home.homeDirectory = "/home/roronoa";
  home.enableNixpkgsReleaseCheck = false;

imports=[./ags.nix
./waybar.nix
./themes/theme.nix
./hyprpaper.nix
./scripts/scripts.nix
./eww/eww.nix
./ags.nix
./starship.nix
];

wayland.windowManager.hyprland.enable=true;
wayland.windowManager.hyprland.extraConfig = ''
  bind = Ctrl, Q, killactive,
  '';

home.file.".config/hypr" = {
     source = ./hypr;
     recursive = true;   
     executable = true;  
};
 
module.phcontrol.enable=true;

programs.kitty={
  enable = true;
  extraConfig = ''
  font_size 14
  background_opacity 0.5
  '';
};

programs.bash.enable=true;
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
airshipper
];

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

}  