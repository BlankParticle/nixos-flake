{ pkgs, username, ... }: {
  users.users.${username} = {
    isNormalUser = true;
    description = "Blank Particle";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    gnome-terminal.enable = true;
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.extraConfig = "Defaults !tty_tickets, pwfeedback";
  };
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
  ];
}
