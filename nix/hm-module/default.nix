{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkOption
    mkEnableOption
    mkPackageOption
    filterAttrs
    ;
  cfg = config.programs.youtube-music;
in
{
  options.programs.youtube-music = {
    enable = mkEnableOption "Enable YouTube Music";
    package = mkPackageOption pkgs "youtube-music" { };
    url = mkOption { default = "https://music.youtube.com"; };
  };

  imports = [
    ./options.nix
    ./plugins
  ];

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile."YouTube Music/config.json".text =
      let
        jsonOptions = builtins.toJSON (filterAttrs (n: v: v != null) cfg.options);
        jsonPlugins = builtins.toJSON cfg.plugins;
        version = cfg.package.version;
      in
      ''
        {
          "window-size": {
            "width": 1100,
            "height": 550
          },
          "window-maximized": false,
          "window-position": {
            "x": -1,
            "y": -1
          },
          "url": "${cfg.url}",
          "options": ${jsonOptions},
          "plugins": ${jsonPlugins},
          "__internal__": {
            "migrations": {
              "version": "${version}"
            }
          }
        }
      '';
  };
}
