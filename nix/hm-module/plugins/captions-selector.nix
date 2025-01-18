{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Whether to enable Captions Selector plugin";
  disableCaptions = mkOption { default = false; };
  autoload = mkOption { default = false; };
  lastCaptionsCode = mkOption { default = ""; };
}
