# youtube-music-nix

## usage

```nix
inputs.youtube-music.url = "github:h-banii/youtube-music-nix";
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
