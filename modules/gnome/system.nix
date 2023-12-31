{ pkgs, ... }: {
  services = {
    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  environment = {
    gnome.excludePackages =
      (with pkgs.gnome; [
        baobab # disk usage analyzer
        cheese # photo booth
        epiphany # web browser
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
        gedit # text editor
        gnome-console
        gnome-connections
        gnome-text-editor
        gnome-tour
      ]);
    variables = {
      NAUTILUS_PYTHON_DEBUG = "misc";
    };
    systemPackages = with pkgs; [
      gnome.dconf-editor
      gnome.nautilus-python
    ];
  };
}
