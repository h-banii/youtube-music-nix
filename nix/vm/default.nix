{
  pkgs,
  youtube-music,
  modulesPath,
  lib,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "youtube-music";

  imports = [
    (modulesPath + "/profiles/minimal.nix")
  ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
    initialHashedPassword = "";
  };
  users.users.root.initialHashedPassword = lib.mkForce "";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";

  environment.systemPackages =
    let
      hypr-config = pkgs.writeText "hypr-config" ''
        $mainMod = CTRL
        bind = $mainMod, T, exec, kitty
        bind = $mainMod, M, exec, youtube-music
        bind = $mainMod, C, killactive
      '';
      hyprland = pkgs.writeShellScriptBin "hyprland" ''
        Hyprland --config ${hypr-config}
      '';
    in
    with pkgs;
    [
      kitty
    ]
    ++ [
      (youtube-music.overrideAttrs (prevAttrs: {
        patches = (prevAttrs.patches or [ ]) ++ [
          ./mpris-desktop-entry.patch
        ];
      }))
      hyprland
    ];

  # TODO: Use the home manager module

  system.stateVersion = "24.05";
}
