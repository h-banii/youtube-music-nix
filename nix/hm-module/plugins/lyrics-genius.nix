{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Enable Lyrics Genius plugin";
  romanizedLyrics = mkOption { default = false; };
}
