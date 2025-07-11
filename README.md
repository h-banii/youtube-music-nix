# youtube-music-nix

Documentation: https://h-banii.github.io/youtube-music-nix/

## Home Manager Module

```nix
inputs.youtube-music = {
    url = "github:h-banii/youtube-music-nix";
    inputs.nixpkgs.follows = "nixpkgs";
};
```

```nix
{
    ...
    imports = [
        inputs.youtube-music.homeManagerModules.default
    ];
    programs.youtube-music = {
        enable = true;
        options = {
            tray = true;
            ...
        };
        plugins = {
            ...
        };
    };
    ...
}
```

## Virtual Machine

Basic usage

```sh
nix run github:h-banii/youtube-music-nix#vm
```

Example on how to set qemu options

```sh
QEMU_OPTS='-m 8192 -vga qxl' nix run .#vm
QEMU_OPTS='-m 8192 -device virtio-vga-gl -display gtk,gl=on' nix run .#vm
```

You can build it and see what the script for starting the VM looks like

```sh
nix build .#vm
```
