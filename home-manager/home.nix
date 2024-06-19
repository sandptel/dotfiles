{ config,lib,inputs,catppuccin, pkgs, ... }:

{
  home.username = "roronoa";
  home.homeDirectory = "/home/roronoa";
  home.enableNixpkgsReleaseCheck = false;

# imports=[./ags.nix];

home.file.".config/hypr" = {
     source = ./hypr;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
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
ags
];

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

}  