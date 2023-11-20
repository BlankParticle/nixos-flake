{ metadata, ... }: {
  networking = {
    hostName = metadata.hostname;
    firewall.enable = false;
    networkmanager = {
      enable = true;
      wifi.powersave = false;
      insertNameservers = [
        "1.1.1.1"
        "1.0.0.1"
        "2606:4700:4700::1111"
        "2606:4700:4700::1001"
      ];
    };
  };
}
