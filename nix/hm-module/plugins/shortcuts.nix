{ lib }:
let
  inherit (lib) mkEnableOption mkOption types;
  shortcutMappingType = types.submodule {
    options = {
      previous = mkOption {
        default = "";
      };
      playPause = mkOption {
        default = "";
      };
      next = mkOption {
        default = "";
      };
    };
  };
  defaultShortcutMapping = {
    previous = "";
    playPause = "";
    next = "";
  };
in
{
  enabled = mkEnableOption "Enable Shortcuts plugin";
  overrideMediaKeys = mkOption {
    default = false;
  };
  global = mkOption {
    default = defaultShortcutMapping;
    type = shortcutMappingType;
  };
  local = mkOption {
    default = defaultShortcutMapping;
    type = shortcutMappingType;
  };
}
