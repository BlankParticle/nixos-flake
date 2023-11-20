{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    curl
    wget
    usbutils
    pciutils
    binutils
    coreutils
    zip
    unzip
    jq
    wl-clipboard
    ripgrep
    fd
    lazygit
    imagemagickBig
    kondo
    tokei
    zellij
    ffmpeg
    nmap
    nil
    nixpkgs-fmt
    shellcheck
  ];
}
