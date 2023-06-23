{ ... }: {
  imports = [ ./dconf.nix ../../home-manager/gtk.nix ];
  services.gpg-agent.pinentryFlavor = "gnome3";
}
