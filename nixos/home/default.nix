{ pkgs, username, ... }:

{
  imports = [
    ./spicetify.nix
    ./starship.nix
    ./dconf.nix
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
      ])
      ++ (with pkgs.nodePackages_latest; [
        pnpm
        typescript
        ts-node
        nodemon
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

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Mauve-Cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  programs = {
    vscode.enable = true;
    neovim.enable = true;
    btop.enable = true;
    git = {
      enable = true;
      userName = "BlankParticle";
      userEmail = "blankparticle@gmail.com";
      signing.signByDefault = true;
      signing.key = "0ACE126D7B359261";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    exa = {
      enable = true;
      enableAliases = true;
      git = true;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh.enable = true;
      oh-my-zsh.plugins = [ "git" ];
      oh-my-zsh.theme = "robbyrussell";
      historySubstringSearch.enable = true;
      shellAliases = {
        cls = "clear";
        vsc = "code - r";
        q = "exit";
      };
    };
  };
  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "gnome3";
    };
  };
}
