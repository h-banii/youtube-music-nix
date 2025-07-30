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
      legacyPackages.${system} =
        let
          default-system = self.lib.mkYtmSystem {
            youtube-music = nixpkgs.legacyPackages.${system}.youtube-music;
          };
        in
        default-system.config.system.build;

      lib = {
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
            modules = [ ./configuration ] ++ extraModules;
          };
      };

      formatter.${system} = pkgs.nixfmt-tree;
    };
}
