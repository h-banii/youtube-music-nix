{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Whether to enable In-App Menu plugin";
  hideDOMWindowControls = mkOption { default = false; };
}
