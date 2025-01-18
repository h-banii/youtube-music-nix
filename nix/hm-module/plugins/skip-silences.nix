{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Whether to enable Skip Silences plugin";
  onlySkipBeginning = mkOption {
    default = false;
  };
}
