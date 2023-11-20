{ pkgs, config, lib, ... }:
{
  home = {
    packages = with pkgs; [
      blackbox-terminal
      (callPackage ../../../pkgs/nautilus-open-in-blackbox { })
    ];
    file."${config.home.homeDirectory}/.local/share/blackbox/schemes/Catppuccin-Mocha.json".source = ./theme.json;
  };
  dconf.settings = {
    "com/raggesilver/BlackBox" = {
      font = "JetBrainsMono Nerd Font 13";
      remember-window-size = true;
      theme-bold-is-bright = true;
      scrollback-mode = lib.hm.gvariant.mkUint32 1;
      cursor-shape = lib.hm.gvariant.mkUint32 1;
      theme-dark = "Catppuccin-Mocha";
    };
  };
}
