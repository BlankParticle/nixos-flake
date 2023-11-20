{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions;[
    appindicator
    mpris-label
    bluetooth-quick-connect
    blur-my-shell
    pano
    search-light
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "mprisLabel@moon-0xff.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "bluetooth-quick-connect@bjarosze.gmail.com"
        "blur-my-shell@aunetx"
        "pano@elhan.io"
        "search-light@icedman.github.com"
        "flypie@schneegans.github.com"
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
      icon-padding = 5;
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
    "org/gnome/shell/extensions/pano" = {
      history-length = 500;
      link-previews = false;
      send-notification-on-copy = false;
      play-audio-on-copy = false;
      sync-primary = false;
      watch-exclusion-list = true;
      global-shortcut = [ "<Super>v" ];
    };
  };
}
