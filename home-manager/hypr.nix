{ inputs, config, lib, pkgs, ... }:

with lib;
let
  extraConfigs = config.hyprland.extraConfig;
  extraConfig = pkgs.writeTextFile {
    name = "custom.conf";
    text = extraConfigs;
  };
in {
  options.hyprland = {
    extraConfig = mkOption {
      type = lib.types.lines;
      default = "";
      example = ''
        # window resize
        bind = $mod, S, submap, resize

        submap = resize
        binde = , right, resizeactive, 10 0
        binde = , left, resizeactive, -10 0
        binde = , up, resizeactive, 0 -10
        binde = , down, resizeactive, 0 10
        bind = , escape, submap, reset
        submap = reset
      '';
      description = ''
        Extra configuration lines to add to `~/.config/hypr/hyprland.conf`.
      '';
    };
  };

  config = {
home.file.".config/hypr" = {
     source = ./hypr;
     recursive = true;   
     executable = true;  
};

    home.file.".config/hypr/custom.conf" = {
     source = extraConfig;
    };

  };
}
