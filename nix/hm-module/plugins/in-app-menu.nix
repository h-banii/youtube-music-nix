{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "In-App Menu plugin";
  hideDOMWindowControls = mkOption { default = false; };
}
