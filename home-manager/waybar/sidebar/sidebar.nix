{pkgs,...}:
pkgs.writeShellScriptBin "sidebar" ''

${pkgs.waybar}/bin/waybar -c ~/.config/waybar/sidebar/config.jsonc -s ~/.config/waybar/sidebar/style.css

''
