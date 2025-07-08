{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeManagerModules.default = ./nix/hm-module;

      legacyPackages.${system} =
        let
          default-system = self.lib.mkYtmSystem {
            youtube-music = nixpkgs.legacyPackages.${system}.youtube-music;
          };
        in
        {
          homeManagerOptionsDoc = self.lib.mkOptionsDoc {
            module = self.homeManagerModules.default;
          };
          vm = default-system.config.system.build.vm;
        };

      lib = {
        mkOptionsDoc = { module }: pkgs.callPackage ./nix/packages/options-doc.nix { inherit module; };
        mkYtmSystem =
          {
            youtube-music,
            extraModules ? [ ],
          }:
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit youtube-music;
              inherit home-manager;
            };
            modules = [ ./nix/vm/default.nix ] ++ extraModules;
          };
      };

      formatter.${system} = pkgs.nixfmt-tree;
    };
}
