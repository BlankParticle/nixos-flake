# 🏡 BlankParticle's NixOS Flake

This is the current NixOS config I am using, all directories and their respective functions are listed.

## 🖥️ [Nixos](./nixos/)

This directory includes config used in a Proper NixOS installation.

- [common](./nixos/common/) includes files that are common in different desktop environments.
- [laptop-gnome](./nixos/laptop-gnome/) includes config that are specific to my laptop and gnome desktop environment.

## 🏠 [Home Manager](./home-manager/)

This directory includes settings for various apps and their configs, these can be imported in system config.

## 🏞️ [Desktop Env](./desktop-env/)

This directory includes settings for various Desktop environments (currently gnome only)

## ⚒️ [Templates](./templates/)

This directory incudes different types of templates based on language and the technology.

The templates usually follow the naming style of `{language}-{technology}`.

These can be used to initialize a project's dependencies.

```bash
nix flake init -t github:BlankParticle/nixos-flake#{template}
```

Usage of [direnv](https://direnv.net/) and [direnv VSCode extension](https://marketplace.visualstudio.com/items?itemName=mkhl.direnv) is recommended.

## 🕯️ [Examples](./examples/)

This directory incudes some examples for using certain things with nix.

## 🩹 Patches

Some app requires patches after installation to work properly, my currently used patches are listed below.

### Enable Krisp Noise suppression in Discord

```bash
discord-krisp-patch
```

## 📝 License

Copyright © 2023 [BlankParticle](https://github.com/BlankParticle). <br />
This project is [MIT](https://github.com/BlankParticle/nixos-flake/blob/main/LICENSE.txt) licensed.
