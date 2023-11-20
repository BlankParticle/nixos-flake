{ pkgs, ... }:
{
  home.packages = [
    pkgs.keepassxc
    (pkgs.makeAutostartItem {
      name = "org.keepassxc.KeePassXC";
      package = pkgs.keepassxc;
      after = ''
        Exec=bash -c 'sleep 5 && keepassxc'
      '';
    })
  ];
}
