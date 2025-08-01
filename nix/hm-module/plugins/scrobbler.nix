{ lib }:
let
  inherit (lib) mkEnableOption mkOption types;
in
{
  enabled = mkEnableOption "Scrobbler plugin";
  scrobbleOtherMedia = mkOption {
    description = "Attempt to scrobble other video types (e.g. Podcasts, normal YouTube videos)";
    default = true;
  };
  alternativeTitles = mkEnableOption "" // {
    description = "Whether to use alternative titles for scrobbling (Useful for non-roman song titles)";
  };
  scrobblers = {
    lastfm = {
      enabled = mkEnableOption "Last.fm scrobbling";
      token = mkOption {
        description = "Token used for authentication";
        default = null;
        type = types.nullOr types.str;
      };
      sessionKey = mkOption {
        description = "Session key used for scrobbling";
        default = null;
        type = types.nullOr types.str;
      };
      apiRoot = mkOption {
        description = "Root of the Last.fm API";
        default = "http =//ws.audioscrobbler.com/2.0/";
      };
      apiKey = mkOption {
        description = "Last.fm api key registered by @semvis123";
        default = "04d76faaac8726e60988e14c105d421a";
      };
      secret = mkOption {
        description = "Last.fm api secret registered by @semvis123";
        default = "a5d2a36fdf64819290f6982481eaffa2";
      };
    };
    listenbrainz = {
      enabled = mkEnableOption "ListenBrainz scrobbling";
      token = mkOption {
        default = null;
        type = types.nullOr types.str;
      };
      apiRoot = mkOption {
        description = "Root of the ListenBrainz API";
        default = "https =//api.listenbrainz.org/1/";
      };
    };
  };
}
