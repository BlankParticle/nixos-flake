{ ... }: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/peripherals/touchpad" = {
        disable-while-typing = false;
        speed = 0.20454545454545459;
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/wm/keybindings" = {
        switch-applications = [ ];
        switch-applications-backward = [ ];
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Shift><Alt>Tab" ];
      };

      "org/gnome/desktop/wm/preferences" = {
        action-middle-click-titlebar = "none";
        button-layout = "appmenu:minimize,maximize,close";
      };

      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        cursor-theme = "Catppuccin-Mocha-Mauve-Cursors";
        enable-hot-corners = false;
        font-antialiasing = "grayscale";
        font-hinting = "slight";
        gtk-theme = "Catppuccin-Mocha-Standard-Mauve-Dark";
        icon-theme = "Adwaita";
        monospace-font-name = "JetBrainsMono Nerd Font 10";
        show-battery-percentage = true;
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control><Alt>t";
        command = "gnome-terminal";
        name = "Terminal";
      };

      "org/gnome/desktop/sound" = {
        allow-volume-above-100-percent = false;
        event-sounds = false;
        theme-name = "__custom";
      };

      "org/gnome/mutter" = {
        attach-modal-dialogs = true;
        center-new-windows = true;
        dynamic-workspaces = true;
        edge-tiling = true;
      };

      "org/gnome/shell" = {
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "clipboard-indicator@tudmotu.com"
          "mprisLabel@moon-0xff.github.com"
          "username-to-activities@deserts"
          "appindicatorsupport@rgcjonas.gmail.com"
          "bluetooth-quick-connect@bjarosze.gmail.com"
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
        divider-string = "|";
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

      "org/gnome/shell/extensions/user-theme" = {
        name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      };

      "org/gnome/terminal/legacy/profiles:" = {
        default = "95894cfd-82f7-430d-af6e-84d168bc34f5";
        list = [ "95894cfd-82f7-430d-af6e-84d168bc34f5" ];
      };

      "org/gnome/terminal/legacy/profiles:/:95894cfd-82f7-430d-af6e-84d168bc34f5" = {
        audible-bell = false;
        background-color = "#1e1e2e";
        bold-is-bright = true;
        cursor-background-color = "#f5e0dc";
        cursor-blink-mode = "on";
        cursor-colors-set = true;
        cursor-foreground-color = "#1e1e2e";
        cursor-shape = "ibeam";
        default-size-columns = 120;
        default-size-rows = 30;
        font = "JetBrainsMono Nerd Font 13";
        foreground-color = "#cdd6f4";
        highlight-background-color = "#1e1e2e";
        highlight-colors-set = true;
        highlight-foreground-color = "#585b70";
        palette = [ "#45475a" "#f38ba8" "#a6e3a1" "#f9e2af" "#89b4fa" "#f5c2e7" "#94e2d5" "#bac2de" "#585b70" "#f38ba8" "#a6e3a1" "#f9e2af" "#89b4fa" "#f5c2e7" "#94e2d5" "#a6adc8" ];
        use-system-font = false;
        use-theme-colors = false;
        visible-name = "BlankUniverse";
      };

      "org/gtk/gtk4/settings/file-chooser" = {
        date-format = "regular";
        location-mode = "path-bar";
        show-hidden = true;
        sort-column = "name";
        sort-directories-first = true;
      };

      "org/gtk/settings/file-chooser" = {
        date-format = "regular";
        location-mode = "path-bar";
        show-hidden = true;
        sort-column = "name";
        sort-directories-first = true;
      };
    };
  };
}
