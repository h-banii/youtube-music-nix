{ lib }:
let
  inherit (lib) mkOption types mkEnableOption;
in
{
  enabled = mkEnableOption "Enable Ambient Mode";
  quality = mkOption {
    default = 50;
    type = types.enum [
      10
      25
      50
      100
      200
      500
      1000
    ];
  };
  buffer = mkOption {
    default = 30;
    type = types.enum [
      1
      5
      10
      20
      30
    ];
  };
  interpolationTime = mkOption {
    default = 1500;
    type = types.enum [
      0
      500
      1000
      1500
      2000
      3000
      4000
      5000
    ];
  };
  blur = mkOption {
    default = 100;
    type = types.enum [
      0
      5
      10
      25
      50
      100
      150
      200
      500
    ];
  };
  size = mkOption {
    default = 100;
    type = types.enum [
      100
      110
      125
      150
      175
      200
      300
    ];
  };
  opacity = mkOption {
    default = 1;
    type = types.enum [
      0.1
      0.2
      0.3
      0.4
      0.5
      0.6
      0.7
      0.8
      0.9
      1
    ];
  };
  fullscreen = mkOption { default = false; };
}
