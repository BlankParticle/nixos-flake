{ pkgs, metadata, ... }: {
  users.users.${metadata.username} = {
    isNormalUser = true;
    description = metadata.fullUsername;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.extraConfig = "Defaults !tty_tickets, pwfeedback";
  };
}
