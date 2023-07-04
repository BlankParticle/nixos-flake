{ pkgs, config, lib, ... }:
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
    (pkgs.makeAutostartItem {
      name = "org.keepassxc.KeePassXC";
      package = pkgs.keepassxc;
      after = ''
        Exec=bash -c 'sleep 5 && keepassxc'
      '';
    })
  ];
  home.file = {
    # Chrome-Dev Message Host
    "${config.xdg.configHome}/google-chrome-unstable/NativeMessagingHosts/org.keepassxc.keepassxc_browser.json".text =
      lib.generators.toJSON { } {
        allowed_origins = [
          "chrome-extension://pdffhmdngciaglkoonimfcmckehcpafo/"
          "chrome-extension://oboonakemofpalcgghocfoadofidjkkk/"
        ];
        description = "KeePassXC integration with native messaging support";
        name = "org.keepassxc.keepassxc_browser";
        path = "${pkgs.keepassxc}/bin/keepassxc-proxy";
        type = "stdio";
      };

    # Config File
    "${config.xdg.configHome}/keepassxc/keepassxc.ini".text =
      lib.generators.toINI { } {
        General = {
          ConfigVersion = 2;
          NumberOfRememberedLastDatabases = 1;
        };
        Browser.Enabled = true;
        GUI = {
          ApplicationTheme = "dark";
          ColorPasswords = true;
          MinimizeOnClose = true;
          MinimizeOnStartup = true;
          MinimizeToTray = true;
          MonospaceNotes = true;
          ShowTrayIcon = true;
          TrayIconAppearance = "colorful";
        };
      };
  };
}
