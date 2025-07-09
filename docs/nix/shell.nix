{
  mkShell,
  nodejs,
  ...
}:
mkShell {
  name = "youtube-music-nix-docs-dev";
  packages = [
    nodejs
  ];
}
