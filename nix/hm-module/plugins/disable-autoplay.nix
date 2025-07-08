{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "'Disable Autoplay' plugin";
  applyOnce = mkOption { default = false; };
}
