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
      deja-dup
      # vscode
      (vscode.overrideAttrs
        (_: (_: {
          src = fetchurl {
            name = "VSCode_1.82.2_linux-x64.tar.gz";
            url = "https://update.code.visualstudio.com/1.82.2/linux-x64/stable";
            hash = "sha256-n+Ark8bysvQU1DEOvNZJWdkTuLZ7nwe/pYUzPj+Z30Q=";
          };
        })))
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
