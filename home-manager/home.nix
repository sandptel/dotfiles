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
];
wayland.windowManager.hyprland.enable=true;
home.file.".config/hypr" = {
     source = ./hypr;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
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
programs.starship = {
    enable = true;
    # catppuccin.enable = true;
    enableBashIntegration=true;
  };
programs.firefox.enable=true;
programs.fuzzel.enable=true;
home.file.".config/fuzzel" = {
     source = ./fuzzel;
     recursive = true;   
     executable = true;  
};

home.file.".config/ags" = {
     source = ./ags;
     recursive = true;   
     executable = true;  
};


home.packages = with pkgs;[
# ags
];

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

}  