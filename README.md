# System Configuration

This repository contains my Nix configuration for a singe user. It configures
things such as

- [A NixOS and MacOS host (the root of the config)](./modules/hosts.nix)
- [Neovim (Nixvim)](./modules/cli-tools/nvim)
- [Zsh](./modules/cli-tools/zsh)
- [Hyprland](./modules/desktop-stack/window-manager.nix)
- [Sketchybar](./modules/desktop-stack/status-bars/sketchybar.nix)
- [Kitty](./modules/gui-apps/kitty.nix)
- [Secrets](./modules/secrets.nix)
- And lots more ...

The repository uses the
[dendritic pattern](https://github.com/Doc-Steve/dendritic-design-with-flake-parts)
for the NixOS, Home-Manager and Nixvim configuration. Although my repository
doesn't contain as many abstractions as other dendritic configurations, I hope
it is easier to understand.

## Try it out

You can test my main NixOS configuration using this single command:

```bash
nix run github:EphraimSiegfried/nix-config#vm
```

The password is `changeme` and keybindings can be activated by pressing:
`ctrl+alt+g` (A terminal can be launched with `alt+shift+t`).

## What the helly is "dendritic"?

Instead of thinking which hosts we want to have and configuring these (like in
[this pattern](https://github.com/Misterio77/nix-starter-configs)), we think
about which features we want hosts to have. The features are standalone Nix
modules which we assign to the hosts we want to have. It's kind of like
[flipping the configuration matrix](https://not-a-number.io/2025/refactoring-my-infrastructure-as-code-configurations/#flipping-the-configuration-matrix).

Here are some ressources I used while creating the configuration:

- [Best explanation](https://github.com/Doc-Steve/dendritic-design-with-flake-parts)
  of dendritic design and has
  [cool configuration tipps](https://github.com/Doc-Steve/dendritic-design-with-flake-parts/wiki/Dendritic_Aspects#design-patterns-for-dendritic-aspects)
- [Also good explanation and contains useful links](https://dendrix.oeiuwq.com/Dendritic.html)
- [Legendary Vimjoyer video](https://www.youtube.com/watch?v=-TRbzkw6Hjs)
- A lot of inspo came from this [repo](https://github.com/dtomvan/puntbestanden)
- [The repository of the founder](https://github.com/mightyiam/dendritic)
