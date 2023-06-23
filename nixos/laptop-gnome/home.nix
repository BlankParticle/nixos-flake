{ pkgs, username, ... }:

{
  imports = [
    ../../desktop-env/gnome/home.nix
    ../../home-manager/zsh.nix
    ../../home-manager/git.nix
    ../../home-manager/starship.nix
    ../../home-manager/spicetify.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages =
      (with pkgs; [
        discord
        google-chrome-dev
        rustup
        obsidian
        keepassxc
        betterdiscordctl
        vlc
        nodePackages_latest.pnpm
      ])
      ++ (with pkgs.gnomeExtensions;
      [
        appindicator
        clipboard-indicator
        mpris-label
        bluetooth-quick-connect
      ]);

    stateVersion = "23.05";
  };

  programs = {
    vscode.enable = true;
    neovim.enable = true;
    btop.enable = true;
    exa = {
      enable = true;
      enableAliases = true;
    };
  };
  services.gpg-agent.enable = true;
}
