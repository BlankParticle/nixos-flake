{ pkgs, username, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      google-chrome-dev
      obsidian
      celluloid
    ];
    stateVersion = "23.05";
  };

  programs = {
    neovim.enable = true;
    exa = {
      enable = true;
      enableAliases = true;
    };
  };
  services.gpg-agent.enable = true;
}
