{ lib }:
let
  inherit (lib) mkOption types mkEnableOption;
in
{
  enabled = mkEnableOption "Enable Ad Blocker";
  cache = mkOption {
    description = "When enabled, the adblocker will cache the blocklists.";
    default = true;
  };
  blocker = mkOption {
    description = "Which adblocker to use.";
    type = types.enum [
      "With blocklists"
      "In player"
      "Ad speedup"
    ];
    default = "In player";
  };
  additionalBlockLists = mkOption {
    description = "Additional list of filters to use.";
    type = types.listOf types.string;
    default = [ ];
  };
  disableDefaultLists = mkEnableOption "Disable the default blocklists.";
}
