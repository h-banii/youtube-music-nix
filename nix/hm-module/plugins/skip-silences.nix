{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Enable Skip Silences plugin";
  onlySkipBeginning = mkOption {
    default = false;
  };
}
