{ pkgs, username, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      google-chrome
      obsidian
      celluloid
      pavucontrol
      playerctl
      yt-dlp
      vscode
      thunderbird
      deja-dup
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
