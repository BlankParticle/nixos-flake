{ pkgs, ... }: {
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment = {
    gnome.excludePackages =
      (with pkgs.gnome; [
        baobab # disk usage analyzer
        cheese # photo booth
        epiphany # web browser
        gedit # text editor
        simple-scan # document scanner
        totem # video player
        yelp # help viewer
        geary # email client
        gnome-contacts
        gnome-maps
        gnome-music
        gnome-system-monitor
        gnome-weather
        gnome-disk-utility
      ]) ++ (with pkgs;[
        gnome-console
        gnome-connections
        gnome-text-editor
        gnome-tour
      ]);
  };
  programs.gnome-terminal.enable = true;
}
