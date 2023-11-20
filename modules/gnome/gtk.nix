{ pkgs, lib, ... }:
let
  gtk-theme = pkgs.catppuccin-gtk.override {
    accents = [ "green" ];
    size = "standard";
    variant = "mocha";
  };
  gtk-theme-name = "Catppuccin-Mocha-Standard-Green-Dark";
in
{
  home.activation.gtk-4-symlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.config/gtk-4.0"
    rm -rf "$HOME/.config/gtk-4.0/assets"
    ln -sf "${gtk-theme}/share/themes/${gtk-theme-name}/gtk-4.0/assets" "$HOME/.config/gtk-4.0/assets"
    ln -sf "${gtk-theme}/share/themes/${gtk-theme-name}/gtk-4.0/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"
    ln -sf "${gtk-theme}/share/themes/${gtk-theme-name}/gtk-4.0/gtk-dark.css" "$HOME/.config/gtk-4.0/gtk-dark.css"
  '';
  gtk = rec {
    enable = true;
    theme = {
      name = gtk-theme-name;
      package = gtk-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Green-Cursors";
      package = pkgs.catppuccin-cursors.mochaGreen;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
      gtk-cursor-theme-name = "Catppuccin-Mocha-Green-Cursors";
      gtk-theme-name = gtk-theme-name;
    };
    gtk4.extraConfig = gtk3.extraConfig;
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Catppuccin-Mocha-Green-Cursors";
      gtk-theme = gtk-theme-name;
      icon-theme = "Adwaita";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = gtk-theme-name;
    };
  };
}
