{ pkgs, username, ... }:

{
  imports = [
    ../../desktop-env/gnome/home.nix
  ]
  ++ map (program: ../../home-manager/${program}.nix)
    [ "zsh" "git" "starship" "spicetify" "gnome-terminal" "direnv" "keepassxc" "discord" "neofetch" "btop" ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      google-chrome-dev
      rustup
      obsidian
      vlc
      nodePackages_latest.pnpm
    ];
    stateVersion = "23.05";
  };

  programs = {
    vscode.enable = true;
    neovim.enable = true;
    exa = {
      enable = true;
      enableAliases = true;
    };
  };
  services.gpg-agent.enable = true;
}
