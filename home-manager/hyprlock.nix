{ inputs, pkgs, ... }:
let 
checklock=pkgs.writeShellScriptBin "checklock" ''
if pgrep -x "hyprlock" > /dev/null
then
    echo '{"text": "🔐", "tooltip": "Locked"}'
else
    echo '{"text": "🔓", "tooltip": "Unlocked"}'
fi
'';

in
{
home.packages = [ 
checklock
pkgs.hyprlock
pkgs.hypridle
 ];
hyprland.extraConfig= "
bindl=,switch:off:Lid Switch, exec, hyprlock -q
";
}