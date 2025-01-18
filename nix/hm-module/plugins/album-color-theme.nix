{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Enable Album Color Theme";
  ratio = mkOption { default = 0.5; };
}
