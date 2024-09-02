{ inputs, pkgs, ... }:
{
  programs.waybar.enable=true;
  home.file.".config/waybar" = {
     source = ./waybar;
     recursive = true;  
     executable = true; 
};

 home.file.".config/scripts/nowplaying" = {
     source = ./scripts/nowplaying;
     recursive = true;  
     executable = true; 
};

 home.file.".config/scripts/swww-pywal" = {
     source = ./scripts/swww-pywal;
     recursive = true;  
     executable = true; 
};


home.packages = [ (import ./waybar/sidebar/sidebar.nix {inherit pkgs;}) ];
hyprland.extraConfig= "
# exec-once = sidebar
exec-once = waybar
";
}