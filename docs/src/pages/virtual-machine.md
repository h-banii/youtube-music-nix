# Virtual Machine

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
