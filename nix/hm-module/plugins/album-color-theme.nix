{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Whether to enable Album Color Theme plugin";
  ratio = mkOption { default = 0.5; };
}
