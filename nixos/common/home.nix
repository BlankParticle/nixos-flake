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
      thunderbird
      deja-dup
      # TODO: maintain this myslef until everything is fixed in upstream
      (callPackage ../../pkgs/vscode { })
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
