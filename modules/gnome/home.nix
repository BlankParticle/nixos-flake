{ ... }: {
  imports = [
    ./prefs.nix
    ./keybindings.nix
    ./extensions.nix
    ./gtk.nix
  ];
  services.gpg-agent.pinentryFlavor = "gnome3";
  dconf.enable = true;
}
