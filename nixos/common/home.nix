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
      # TODO: remove the Override once the issue is fixed
      (vscode.overrideAttrs (oldAttrs: {
        runtimeDependencies = (oldAttrs.runtimeDependencies or [ ]) ++ [ libsecret ];
      }))
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
