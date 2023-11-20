{ metadata, pkgs, ... }: {
  services = {
    # syncthing = {
    #   enable = true;
    #   user = metadata.username;
    #   dataDir = "/home/${metadata.username}/Data/Sync";
    #   configDir = "/home/${metadata.username}/.config/syncthing";
    # };
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      excludePackages = [ pkgs.xterm ];
    };
    printing.enable = false;
    openssh.enable = true;
    pcscd.enable = true;
    gnome.gnome-browser-connector.enable = true;
    postgresql = {
      enable = true;
      package = pkgs.postgresql_15;
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  host       auth-method
        local all       all                    trust
        host  all       all     127.0.0.1/32   trust
        host  all       all     ::1/128        trust
      '';
    };
  };
}
