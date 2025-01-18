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
            "ambient-mode"
            "api-server"
            "crossfade"
            "discord"
            "downloader"
            "equalizer"
          ]
      ))
      {
        album-actions.enabled = mkEnableOption "Enable Album Actions";
        album-color-theme = {
          enabled = mkEnableOption "Enable Album Color Theme";
          ratio = mkOption { default = 0.5; };
        };
        amuse.enabled = mkEnableOption "Enable Amuse";
        blur-nav-bar = mkEnableOption "Enable Blur Navigation Bar";
        bypass-age-restrictions = mkEnableOption "Enable Bypass Age Restrictions";
        captions-selector = {
          enabled = mkEnableOption "Enable Captions Selector";
          disableCaptions = mkOption { default = false; };
          autoload = mkOption { default = false; };
          lastCaptionsCode = mkOption { default = ""; };
        };
        compact-sidebar.enabled = mkEnableOption "Enable Compact Sidebar";
        disable-autoplay = {
          enabled = mkEnableOption "Enable 'Disable Autoplay'";
          applyOnce = mkOption { default = false; };
        };
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
