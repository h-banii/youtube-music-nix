{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Enable In-App Menu plugin";
  hideDOMWindowControls = mkOption { default = false; };
}
