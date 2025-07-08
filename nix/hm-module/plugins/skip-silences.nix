{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Skip Silences plugin";
  onlySkipBeginning = mkOption {
    default = false;
  };
}
