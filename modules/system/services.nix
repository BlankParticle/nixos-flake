{ metadata, pkgs, ... }: {
  services = {
    syncthing = {
      enable = true;
      user = metadata.username;
      dataDir = "/home/${metadata.username}/.config/syncthing";
      configDir = "/home/${metadata.username}/.config/syncthing";
    };
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
  };
}
