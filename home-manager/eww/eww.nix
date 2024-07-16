{ inputs, pkgs, ... }:
{

home.file.".config/eww" = {
  source = ./eww;
  recursive = true;
  executable = true;
};


home.packages = with pkgs; [
  eww
  ubuntu_font_family
  socat
  jq
  eww
  bluez
  pavucontrol
  brightnessctl
  playerctl
  acpi
  inotify-tools
  networkmanagerapplet
  imagemagick
  gjs
  gnome.gnome-bluetooth
  upower
  networkmanager
  gtk3
  wl-gammactl
  wlsunset
  wl-clipboard
  hyprpicker
  hyprshot
  blueberry
  polkit_gnome
];
}