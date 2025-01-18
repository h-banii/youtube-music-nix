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
            "sponsorblock"
            "synced-lyrics"
            "video-toggle"
            "visualizer"
          ]
      ))
      {
        album-actions.enabled = mkEnableOption "Whether to enable Album Actions plugin";
        amuse.enabled = mkEnableOption "Whether to enable Amuse plugin";
        blur-nav-bar = mkEnableOption "Whether to enable Blur Navigation Bar plugin";
        bypass-age-restrictions = mkEnableOption "Whether to enable Bypass Age Restrictions plugin";
        compact-sidebar.enabled = mkEnableOption "Whether to enable Compact Sidebar plugin";
        exponential-volume.enabled = mkEnableOption "Whether to enable Exponential Volume plugin";
        lumiastream.enabled = mkEnableOption "Whether to enable Lumia Stream plugin";
        music-together.enabled = mkEnableOption "Whether to enable Music Together plugin";
        navigation.enabled = mkEnableOption "Whether to enable Navigation plugin";
        no-google-login = mkEnableOption "Whether to enable No Google Login plugin";
        playback-speed = mkEnableOption "Whether to enable Playback Speed plugin";
        quality-changer = mkEnableOption "Whether to enable Quality Changer plugin";
        skip-disliked-songs = mkEnableOption "Whether to enable Skip Disliked Songs plugin";
        taskbar-mediacontrol = mkEnableOption "Whether to enable Taskbar Media Control plugin (Windows)";
        touchbar = mkEnableOption "Whether to enable TouchBar plugin";
        tuna-obs = mkEnableOption "Whether to enable Tuna OBS plugin";
      };
}
