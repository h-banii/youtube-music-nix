{ lib, ... }:
let
  inherit (lib) mkOption mkEnableOption mergeAttrs;
  inherit (builtins) listToAttrs map;
in
{
  options.programs.youtube-music.plugins =
    mergeAttrs
      (listToAttrs (
        map
          (plugin: {
            name = plugin;
            value = import ./${plugin}.nix { inherit lib; };
          })
          [
            "adblocker"
            "album-color-theme"
            "ambient-mode"
            "api-server"
            "captions-selector"
            "crossfade"
            "disable-autoplay"
            "discord"
            "downloader"
            "equalizer"
          ]
      ))
      {
        album-actions.enabled = mkEnableOption "Enable Album Actions";
        amuse.enabled = mkEnableOption "Enable Amuse";
        blur-nav-bar = mkEnableOption "Enable Blur Navigation Bar";
        bypass-age-restrictions = mkEnableOption "Enable Bypass Age Restrictions";
        compact-sidebar.enabled = mkEnableOption "Enable Compact Sidebar";
        exponential-volume.enabled = mkEnableOption "Enable Exponential Volume plugin";
        in-app-menu = {
          enabled = mkEnableOption "Enable In-App Menu plugin";
          hideDOMWindowControls = mkOption { default = false; };
        };
        lumiastream.enabled = mkEnableOption "Enable Lumia Stream plugin";
        lyrics-genius = {
          enabled = mkEnableOption "Enable Lyrics Genius plugin";
          romanizedLyrics = mkOption { default = false; };
        };
      };

}
