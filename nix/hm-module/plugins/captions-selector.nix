{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Enable Captions Selector";
  disableCaptions = mkOption { default = false; };
  autoload = mkOption { default = false; };
  lastCaptionsCode = mkOption { default = ""; };
}
