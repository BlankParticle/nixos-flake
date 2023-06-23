{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Mauve-Cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Catppuccin-Mocha-Mauve-Cursors";
      gtk-theme = "Catppuccin-Mocha-Standard-Mauve-dark";
      icon-theme = "Adwaita";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Standard-Mauve-dark";
    };
  };
}
