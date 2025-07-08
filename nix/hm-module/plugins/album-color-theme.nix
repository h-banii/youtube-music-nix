{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Album Color Theme plugin";
  ratio = mkOption { default = 0.5; };
}
