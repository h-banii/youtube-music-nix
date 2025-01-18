{ lib }:
let
  inherit (lib) mkOption mkEnableOption types;
in
{
  enabled = mkEnableOption "Enable API-Server";
  hostname = mkOption { default = "0.0.0.0"; };
  port = mkOption { default = 26538; };
  authStrategy = mkOption {
    type = types.enum [
      "AUTH_AT_FIRST"
      "NONE"
    ];
    default = "AUTH_AT_FIRST";
  };
  secret = mkOption { default = ""; };
  authorizedClients = mkOption {
    default = [ ];
    type = types.listOf types.str;
  };
}
