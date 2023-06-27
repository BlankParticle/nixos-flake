{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions;[
    appindicator
    clipboard-indicator
    mpris-label
    bluetooth-quick-connect
    blur-my-shell
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "clipboard-indicator@tudmotu.com"
        "mprisLabel@moon-0xff.github.com"
        "username-to-activities@deserts"
        "appindicatorsupport@rgcjonas.gmail.com"
        "bluetooth-quick-connect@bjarosze.gmail.com"
        "blur-my-shell@aunetx"
      ];
    };

    "org/gnome/shell/extensions/appindicator" = {
      icon-saturation = 2.7755575615628914;
      icon-size = 0;
      legacy-tray-enabled = false;
    };

    "org/gnome/shell/extensions/bluetooth-quick-connect" = {
      keep-menu-on-toggle = true;
      show-battery-value-on = true;
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      history-size = 200;
      move-item-first = true;
    };

    "org/gnome/shell/extensions/mpris-label" = {
      auto-switch-to-most-recent = true;
      button-placeholder = "";
      divider-string = "\ |\ ";
      extension-index = 0;
      first-field = "xesam:title";
      icon-padding = 0;
      last-field = "";
      left-click-action = "play-pause";
      left-padding = 5;
      max-string-length = 35;
      middle-click-action = "activate-player";
      remove-text-when-paused = false;
      right-click-action = "open-menu";
      right-padding = 5;
      second-field = "xesam:artist";
      show-icon = "left";
      symbolic-source-icon = true;
      thumb-backward-action = "none";
      thumb-forward-action = "none";
      use-album = false;
    };
    "org/gnome/shell/extensions/blur-my-shell" = {
      debug = false;
      hacks-level = 1;
    };
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      style-components = 2;
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };
  };
}
