{ lib }:
let
  inherit (lib) mkEnableOption mkOption;
in
{
  enabled = mkEnableOption "Whether to enable Lyrics Genius plugin";
  romanizedLyrics = mkOption { default = false; };
}
