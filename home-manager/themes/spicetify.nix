{lib,pkgs,inputs, ...}:
{

  home.packages = with pkgs; [
    spicetify-cli
  ];

  home.file.".config/spicetify/Themes/Dribbblish" = {
    source = ./spicetify/Themes/Dribbblish;
    recursive = true;
    executable = true;
  };

  home.file.".config/spicetify/config-xpui.ini" = {
    source = ./spicetify/config-xpui.ini;
  };
   
  home.activation = {
  spicetify-apply = lib.hm.dag.entryAfter ["writeBoundary"] ''
    run ${pkgs.spicetify-cli}/bin/spicetify apply
  '';
  };
}