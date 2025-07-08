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
      inherit (nixpkgs) lib;
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
          homeManagerOptionsDoc =
            let
              eval = lib.evalModules {
                modules = [
                  {
                    options._module.args = lib.mkOption {
                      internal = true;
                    };
                    config = {
                      _module.check = false;
                    };
                  }
                  self.homeManagerModules.default
                ];
              };
            in
            pkgs.nixosOptionsDoc {
              # TODO: Fix warnings... (add missing descriptions to ALL options)
              warningsAreErrors = false;
              inherit (eval) options;
            };
          vm = default-system.config.system.build.vm;
        };

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
