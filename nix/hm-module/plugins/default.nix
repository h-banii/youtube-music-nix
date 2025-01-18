{ lib }:
let
  inherit (lib) mkOption mkEnableOption;
in
{
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
}
