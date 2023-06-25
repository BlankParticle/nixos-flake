{ pkgs, config, ... }:
{
  home.packages = [
    (pkgs.keepassxc.override {
      withKeePassX11 = false;
      withKeePassFDOSecrets = false;
      withKeePassKeeShare = false;
      withKeePassNetworking = false;
      withKeePassSSHAgent = false;
      withKeePassTouchID = false;
      withKeePassYubiKey = false;
    })
  ];

  home.file = {
    # Autostart
    "${config.xdg.configHome}/autostart/org.keepassxc.KeePassXC.desktop" = {
      text = ''
        [Desktop Entry]
        Name=KeePassXC
        GenericName=Password Manager
        Exec=keepassxc
        TryExec=keepassxc
        Icon=keepassxc
        StartupWMClass=keepassxc
        StartupNotify=true
        Terminal=false
        Type=Application
        Version=1.0
        Categories=Utility;Security;Qt;
        MimeType=application/x-keepass2;
        X-GNOME-Autostart-enabled=true
        X-GNOME-Autostart-Delay=10
        X-KDE-autostart-after=panel
        X-LXQt-Need-Tray=true
      '';
    };

    # Chrome-Dev Message Host
    "${config.xdg.configHome}/google-chrome-unstable/NativeMessagingHosts/org.keepassxc.keepassxc_browser.json" = {
      text = ''
              {
            "allowed_origins": [
                "chrome-extension://pdffhmdngciaglkoonimfcmckehcpafo/",
                "chrome-extension://oboonakemofpalcgghocfoadofidjkkk/"
            ],
            "description": "KeePassXC integration with native messaging support",
            "name": "org.keepassxc.keepassxc_browser",
            "path": "${pkgs.keepassxc}/bin/keepassxc-proxy",
            "type": "stdio"
        }
      '';
    };

    # Config File
    "${config.xdg.configHome}/keepassxc/keepassxc.ini" = {
      text = ''
        [General]
        ConfigVersion=2
        NumberOfRememberedLastDatabases=1

        [Browser]
        CustomProxyLocation=
        Enabled=true

        [GUI]
        ApplicationTheme=dark
        ColorPasswords=true
        MinimizeOnClose=true
        MinimizeOnStartup=true
        MinimizeToTray=true
        MonospaceNotes=true
        ShowTrayIcon=true
        TrayIconAppearance=colorful

        [PasswordGenerator]
        AdditionalChars=
        ExcludedChars=
      '';
    };
  };
}
