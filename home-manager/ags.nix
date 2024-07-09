{ inputs, pkgs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    ollama
    pywal
    sassc
    (python311.withPackages (p: [
      p.material-color-utilities
      p.pywayland
    ]))
  ];
  
home.file.".config/ags" = {
     source = ./ags;
     recursive = true;   
     executable = true;  
};
  programs.ags = {
    enable = true;
    # configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ./.config/ags;

    extraPackages = with pkgs; [
      gjs
      libdbusmenu
      libdbusmenu-gtk3
      gtksourceview
      gtksourceview4
      ollama
      python311
      python311Packages.material-color-utilities
      python311Packages.pywayland
      pywal
      sassc
      webkitgtk
      webp-pixbuf-loader
      ydotool
      swww
      sass
      fd
      dart-sass
    ];
  };
}