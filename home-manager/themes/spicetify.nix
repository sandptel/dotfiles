{ inputs,config, lib, pkgs, ... }:
with lib;
let
  cfg = config.module.spicetify;
in {
  options.module.spicetify = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Spicetify";
    };

    theme = lib.mkOption {
      type = lib.types.str;
      default = "Dribbblish";
      description = "Current theme for Spicetify";
    };

    color = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Color Scheme";
    };

    spotify_path = lib.mkOption {
      type = lib.types.path;
      default = /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify;
      description = "Path to Spotify application";
    };

    prefs_path = lib.mkOption {
      type = lib.types.path;
      default = "${config.home.homeDirectory}/.var/app/com.spotify.Client/config/spotify/prefs";
      description = "Path to Spotify prefs";
    };    

    check_spicetify_update = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable check_spicetify_update";
    };

    always_enable_devtools = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable or disable always_enable_devtools";
    };

    inject_css = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable inject_css";
    };

    replace_colors = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable color replacement";
    };

    overwrite_assets = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable overwrite_assets";
    };

    spotify_launch_flags = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Spotify launch flags";
    };

    inject_theme_js = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable inject_theme_js";
    };

#preprocesses

    disable_sentry = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable disable_sentry";
    };

    disable_ui_logging = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable disable_ui_logging";
    };

    remove_rtl_rule = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable remove_rtl_rule";
    };

    expose_apis = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable expose_apis";
    };
#additionaloptions
    sidebar_config = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable sidebar_config";
    };

    home_config = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable home_config";
    };

    experimental_features = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable or disable experimental_features";
    };

    extensions = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Extensions";
    };

    custom_apps = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Custom apps";
    };
};    

  config = mkMerge [
    ( mkIf cfg.enable {
    home.packages = [ pkgs.spicetify-cli ];
    home.file.".config/spicetify/Themes" = {
      source = ./spicetify/Themes;
      recursive = true;
      executable = true;
    };
    home.file.".config/spicetify/config-xpui.ini" = {
      text= "
[Patch]
[Setting]
check_spicetify_update = ${if cfg.check_spicetify_update then "1" else "0"}
always_enable_devtools = ${if cfg.always_enable_devtools then "1" else "0"}
prefs_path             = ${ toString cfg.prefs_path}
color_scheme           = ${cfg.color}
inject_css             = ${if cfg.inject_css then "1" else "0"}
replace_colors         = ${if cfg.replace_colors then "1" else "0"}
overwrite_assets       = ${if cfg.overwrite_assets then "1" else "0"}
spotify_launch_flags   = ${cfg.spotify_launch_flags}
spotify_path           = ${ toString cfg.spotify_path}
current_theme          = ${cfg.theme}
inject_theme_js        = ${if cfg.inject_theme_js then "1" else "0"}

[Preprocesses]
disable_sentry     = ${if cfg.disable_sentry then "1" else "0"}
disable_ui_logging = ${if cfg.disable_ui_logging then "1" else "0"}
remove_rtl_rule    = ${if cfg.remove_rtl_rule then "1" else "0"}
expose_apis        = ${if cfg.expose_apis then "1" else "0"}

[AdditionalOptions]
sidebar_config        = ${if cfg.sidebar_config then "1" else "0"}
home_config           = ${if cfg.home_config then "1" else "0"}
experimental_features = ${if cfg.experimental_features then "1" else "0"}
extensions            = ${cfg.extensions}
custom_apps           = ${cfg.custom_apps}

; DO NOT CHANGE!
[Backup]
version = 1.2.37.701.ge66eb7bc
with    = 2.36.11
      ";
    };
    home.activation = {
      spicetify-apply = lib.hm.dag.entryAfter ["writeBoundary"] ''
        run ${pkgs.spicetify-cli}/bin/spicetify apply
        #run chmod a+wr ${cfg.spotify_path}
        #run chmod a+wr -R ${cfg.spotify_path}/Apps
      '';
    };
    })
    ( mkIf (cfg.enable == false) {
      home.activation = {
      spicetify-remove = lib.hm.dag.entryAfter ["writeBoundary"] ''
            if [ -d ${config.home.homeDirectory}/.config/spicetify ]; then
            echo "Removing Spicetify configuration"
            old_text="prefs_path             ="
            new_text="prefs_path= ${toString cfg.prefs_path}"
            sed -i "s#$old_text#$new_text#g" ${toString config.home.homeDirectory}/.config/spicetify/config-xpui.ini
            ${pkgs.spicetify-cli}/bin/spicetify restore
            # rm -rf ${config.home.homeDirectory}/.config/spicetify
          fi
      '';
    };
    }
  )];
}