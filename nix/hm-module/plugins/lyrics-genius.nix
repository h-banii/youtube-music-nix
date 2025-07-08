{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Lyrics Genius plugin";
  romanizedLyrics = mkOption { default = false; };
}
