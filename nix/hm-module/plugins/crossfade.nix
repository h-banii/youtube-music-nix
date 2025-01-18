{ lib }:
let
  inherit (lib) mkEnableOption mkOption types;
in
{
  enabled = mkEnableOption "Whether to enable Crossfade plugin";
  fadeInDuration = mkOption { default = 1500; };
  fadeOutDuration = mkOption { default = 5000; };
  secondsBeforeEnd = mkOption { default = 10; };
  fadeScaling = mkOption {
    default = "linear";
    type = types.oneOf [
      (types.enum [
        "linear"
        "logarithmic"
      ])
      types.int
    ];
  };
}
