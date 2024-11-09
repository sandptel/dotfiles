{ inputs, pkgs, ... }:
let 
glacier= import ./glacier/default.nix{inherit pkgs;};
in
{

  home.file.".config/eww" = {
     source = glacier;
     recursive = true;  
     executable = true; 
};

home.packages = with pkgs;[ 
wlogout

libnotify
bluez
mpc-cli
ffmpeg
dunst
moreutils
recode
# cat
gawk
gnused
 ];

}