{ pkgs, metadata, ... }: {
  imports = [ ../../modules/gnome/home.nix ]
    ++ map (program: ../../modules/home/${program})
    [
      "zsh"
      "git"
      "starship"
      "blackbox"
      "direnv"
      "keepassxc"
      "discord"
      "neofetch"
      "btop"
      "obs-studio"
    ];

  home = {
    inherit (metadata) username;
    homeDirectory = "/home/${metadata.username}";
    packages = with pkgs; [
      google-chrome
      obsidian
      celluloid
      pavucontrol
      playerctl
      yt-dlp
      vscode
    ];
    stateVersion = "23.05";
  };
  programs =
    {
      neovim.enable = true;
      eza = {
        enable = true;
        enableAliases = true;
      };
    };
  services.gpg-agent.enable = true;
}

