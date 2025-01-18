{ lib }:
let
  inherit (lib) mkEnableOption mkOption types;
in
{
  enabled = mkEnableOption "Whether to enable SponsorBlock plugin";
  apiURL = mkOption {
    default = "https://sponsor.ajay.app";
  };
  categories =
    let
      categoryList = [
        "sponsor"
        "intro"
        "outro"
        "interaction"
        "selfpromo"
        "music_offtopic"
      ];
    in
    mkOption {
      default = categoryList;
      type = types.listOf (types.enum categoryList);
    };
}
