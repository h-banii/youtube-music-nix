{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Enable 'Disable Autoplay'";
  applyOnce = mkOption { default = false; };
}
