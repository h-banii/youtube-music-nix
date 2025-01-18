{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs =
    { ... }:
    {
      homeManagerModules.default = ./nix/hm-module;
    };
}
