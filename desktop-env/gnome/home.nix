{ ... }: {
  imports = [
    ./prefs.nix
    ./keybindings.nix
    ./extensions.nix
    ../../home-manager/gtk.nix
  ];
  services.gpg-agent.pinentryFlavor = "gnome3";
  dconf.enable = true;
}
