{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Whether to enable 'Disable Autoplay' plugin";
  applyOnce = mkOption { default = false; };
}
