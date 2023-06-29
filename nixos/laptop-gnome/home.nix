{ pkgs, username, ... }:

{
  imports = [
    ../../desktop-env/gnome/home.nix
  ]
  ++ map (program: ../../home-manager/${program}.nix)
    [ "zsh" "git" "starship" "spicetify" "gnome-terminal" "direnv" "keepassxc" "discord" "neofetch" "btop" "vscode" ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      google-chrome-dev
      obsidian
      vlc
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
