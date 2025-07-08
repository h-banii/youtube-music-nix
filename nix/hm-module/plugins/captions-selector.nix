{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Captions Selector plugin";
  disableCaptions = mkOption { default = false; };
  autoload = mkOption { default = false; };
  lastCaptionsCode = mkOption { default = ""; };
}
