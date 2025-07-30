{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      docs = (import ./docs/flake.nix).outputs {
        inherit nixpkgs;
        inherit systems;
      };
    in
    {
      homeManagerModules.default = ./nix/hm-module;

      legacyPackages.${system} =
        let
          homeManagerOptionsJSON = self.legacyPackages.${system}.homeManagerOptionsDoc.optionsJSON;
        in
        {
          homeManagerOptionsDoc = self.lib.mkOptionsDoc {
            module = self.homeManagerModules.default;
          };
          docs = pkgs.symlinkJoin {
            name = "youtube-music-nix-docs";
            paths = [
              docs.packages.${system}.default
              (pkgs.linkFarm "youtube-music-nix-hm-options" [
                {
                  name = "home-manager-options.json";
                  path = "${homeManagerOptionsJSON}/share/doc/nixos/options.json";
                }
              ])
            ];
          };
        };

      lib = {
        mkOptionsDoc = { module }: pkgs.callPackage ./nix/packages/options-doc.nix { inherit module; };
      };

      formatter.${system} = pkgs.nixfmt-tree;
    };
}
