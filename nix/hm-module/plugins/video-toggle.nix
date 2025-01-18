{ lib }:
let
  inherit (lib) mkEnableOption mkOption types;
in
{
  enabled = mkEnableOption "Whether to enable Video Toggle plugin";
  hideVideo = mkOption {
    default = false;
  };
  mode = mkOption {
    default = "custom";
    type = types.enum [
      "custom"
      "native"
      "disabled"
    ];
  };
  forceHide = mkOption {
    default = false;
  };
  align = mkOption {
    default = "left";
    type = types.enum [
      "left"
      "middle"
      "right"
    ];
  };
}
