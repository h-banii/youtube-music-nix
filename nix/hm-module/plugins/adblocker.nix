{ lib }:
let
  inherit (lib) mkOption types mkEnableOption;
in
{
  enabled = mkEnableOption "AdBlocker plugin";
  cache = mkOption {
    description = "When enabled, the adblocker will cache the blocklists";
    default = true;
  };
  blocker = mkOption {
    description = "Which adblocker to use";
    type = types.enum [
      "With blocklists"
      "In player"
      "Ad speedup"
    ];
    default = "In player";
  };
  additionalBlockLists = mkOption {
    description = "Additional list of filters to use";
    type = types.listOf types.str;
    default = [ ];
  };
  disableDefaultLists = mkEnableOption null // {
    description = "Whether to disable the default blocklists";
  };
}
