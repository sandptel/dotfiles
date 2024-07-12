{pkgs,catppuccin,...}:
let
  theme = "catppuccin-mocha-lavender";
in
{
#theming
#  gtk = {
#     theme = {
#       package = pkgs.catppuccin-gtk;
#       name = "Catppuccin-Mocha";
#     };
#     iconTheme.package = pkgs.catppuccin-icons;
#     cursorTheme.size = 30;
#   };
#none of the above commands work and only this sessionVariable command works and only this one theme gets installed via catppuccin-gtk

home.packages= with pkgs;[catppuccin-kde
gnome.gnome-tweaks
catppuccin-gtk
catppuccin-qt5ct];

home.sessionVariables.GTK_THEME = "${theme}";
home.file.".themes/${theme}" = {
     source = ./${theme}; 
     recursive = true;   
     executable = true;  
};
home.file.".config/gtk-4.0" = {
     source = ./${theme}/gtk-4.0; 
     recursive = true;   
     executable = true;  
     
};
catppuccin.enable=true;
catppuccin.flavor = "mocha";
catppuccin.accent = "lavender";
gtk.catppuccin.enable =true;
gtk.catppuccin.gnomeShellTheme=true;
qt.enable=true;
qt.style.catppuccin.enable=true;


imports = [
  ./spotify.nix 
];

}