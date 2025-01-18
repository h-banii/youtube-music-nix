{ lib, ... }:
let
  inherit (lib) mkEnableOption mergeAttrs;
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
            "in-app-menu"
            "lyrics-genius"
            "notifications"
            "picture-in-picture"
            "precise-volume"
            "scrobbler"
            "shortcuts"
            "skip-silences"
            "synced-lyrics"
          ]
      ))
      {
        album-actions.enabled = mkEnableOption "Enable Album Actions";
        amuse.enabled = mkEnableOption "Enable Amuse";
        blur-nav-bar = mkEnableOption "Enable Blur Navigation Bar";
        bypass-age-restrictions = mkEnableOption "Enable Bypass Age Restrictions";
        compact-sidebar.enabled = mkEnableOption "Enable Compact Sidebar";
        exponential-volume.enabled = mkEnableOption "Enable Exponential Volume plugin";
        lumiastream.enabled = mkEnableOption "Enable Lumia Stream plugin";
        music-together.enabled = mkEnableOption "Enable Music Together plugin";
        navigation.enabled = mkEnableOption "Enable Navigation plugin";
        no-google-login = mkEnableOption "Enable No Google Login plugin";
        playback-speed = mkEnableOption "Enable Playback Speed plugin";
        quality-changer = mkEnableOption "Enable Quality Changer plugin";
        skip-disliked-songs = mkEnableOption "Enable Skip Disliked Songs plugin";
      };
}
