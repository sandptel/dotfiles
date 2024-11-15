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
whitesur-icon-theme
gradience 
gnome-tweaks
catppuccin-gtk
catppuccin-qt5ct];

home.sessionVariables.GTK_THEME = "${theme}";
# home.sessionVariables.GTK_THEME = "adwaita";
home.file.".themes/${theme}" = {
     source = ./${theme}; 
     recursive = true;   
     executable = true;  
};
home.file.".config/gtk-4.0" = {
     source = ./catppuccin-mocha-lavender/gtk-4.0; 
     recursive = true;   
     executable = true;  
};
catppuccin.enable=true;
qt.style.name="kvantum";
qt.platformTheme.name="kvantum";
catppuccin.flavor = "mocha";
# catppuccin.accent = "Sky";
gtk.catppuccin.enable =true;
gtk.enable=true;
gtk.catppuccin.gnomeShellTheme=true;
qt.enable=true;
qt.style.catppuccin.enable=true;


imports = [
  # ./spicetify.nix //up for fix
  ./hyprpaper.nix
];

}