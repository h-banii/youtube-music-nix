{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixpkgs-master.url = "github:NixOS/nixpkgs/master";

  outputs =
    { nixpkgs, nixpkgs-master, ... }:
    let
      system = "x86_64-linux";
      youtube-music = nixpkgs-master.legacyPackages.${system}.youtube-music;
    in
    {
      homeManagerModules.default = ./nix/hm-module;

      youtube-music =
        let
          youtube-music-system = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit youtube-music;
            };
            modules = [ ./nix/vm/default.nix ];
          };
        in
        {
          vm = youtube-music-system.config.system.build.vm;
        };
    };
}
