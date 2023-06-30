{ pkgs, ... }: {
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
      jetbrains-mono
      (import
        ../sources/apple-font.nix
        {
          inherit lib;
          inherit (pkgs) stdenv p7zip;
          inherit (builtins) fetchurl;
        })
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };
}
