{ username, pkgs, ... }: {
  services = {
    syncthing = {
      enable = true;
      user = username;
      dataDir = "/home/${username}/Data/Sync";
      configDir = "/home/${username}/.config/syncthing";
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
