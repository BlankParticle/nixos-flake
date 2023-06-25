{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    discord
    betterdiscordctl
  ];

  home.file."${config.xdg.configHome}/BetterDiscord/themes/mocha.theme.css" = {
    text = ''
       /**
       * @name Catppuccin Mocha
       * @author winston#0001
       * @authorId 505490445468696576
       * @version 0.2.0
       * @description 🎮 Soothing pastel theme for Discord
       * @website https://github.com/catppuccin/discord
       * @invite r6Mdz5dpFc
       * **/

      @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
    '';
  };
}