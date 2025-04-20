{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixpkgs-master.url = "github:NixOS/nixpkgs/master";

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-master,
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
            youtube-music = nixpkgs-master.legacyPackages.${system}.youtube-music;
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
          };
          modules = [ ./nix/vm/default.nix ] ++ extraModules;
        };
    };
}
