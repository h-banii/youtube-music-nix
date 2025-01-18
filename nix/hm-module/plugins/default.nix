{ lib, ... }:
let
  inherit (lib) mkOption mkEnableOption;
in
{
  options.programs.youtube-music.plugins = {
    adblocker = import ./adblocker.nix { inherit lib; };
    album-actions.enabled = mkEnableOption "Enable Album Actions";
    album-color-theme = {
      enabled = mkEnableOption "Enable Album Color Theme";
      ratio = mkOption { default = 0.5; };
    };
    ambient-mode = import ./ambient-mode.nix { inherit lib; };
    amuse.enabled = mkEnableOption "Enable Amuse";
    api-server = import ./api-server.nix { inherit lib; };
    blur-nav-bar = mkEnableOption "Enable Blur Navigation Bar";
    bypass-age-restrictions = mkEnableOption "Enable Bypass Age Restrictions";
    captions-selector = {
      enabled = mkEnableOption "Enable Captions Selector";
      disableCaptions = mkOption { default = false; };
      autoload = mkOption { default = false; };
      lastCaptionsCode = mkOption { default = ""; };
    };
    compact-sidebar.enabled = mkEnableOption "Enable Compact Sidebar";
    crossfade = import ./crossfade.nix { inherit lib; };
    disable-autoplay = {
      enabled = mkEnableOption "Enable 'Disable Autoplay'";
      applyOnce = mkOption { default = false; };
    };
    discord = import ./discord.nix { inherit lib; };
    downloader = import ./downloader.nix { inherit lib; };
  };
}
