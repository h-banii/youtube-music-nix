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
    in
    {
      homeManagerModules.default = ./nix/hm-module;

      vm =
        let
          default-system = self.lib.mkYtmSystem {
            youtube-music = nixpkgs.legacyPackages.${system}.youtube-music;
          };
        in
        default-system.config.system.build.vm;

      lib.mkYtmSystem =
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
}
