{ lib }:
let
  inherit (lib) mkOption mkEnableOption;
in
{
  enabled = mkEnableOption "Discord Rich Presence plugin";
  autoReconnect = mkOption {
    description = "If enabled, will try to reconnect to discord every 5 seconds after disconnecting or failing to connect";
    default = true;
  };
  activityTimeoutEnabled = mkOption {
    description = "If enabled, the discord rich presence gets cleared when music paused after the time specified below";
    default = true;
  };
  activityTimeoutTime = mkOption {
    description = "The time in milliseconds after which the discord rich presence gets cleared when music paused";
    default = 10 * 60 * 1000;
  };
  playOnYouTubeMusic = mkOption {
    description = ''Add a "Play on YouTube Music" button to rich presence'';
    default = false;
  };
  hideGitHubButton = mkOption {
    description = ''Hide the "View App On GitHub" button in the rich presence'';
    default = false;
  };
  hideDurationLeft = mkOption {
    description = ''Hide the "duration left" in the rich presence'';
    default = false;
  };
}
