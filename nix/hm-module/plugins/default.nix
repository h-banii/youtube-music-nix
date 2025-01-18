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
}
