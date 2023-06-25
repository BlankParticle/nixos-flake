{ ... }:
let
  uuid = "95894cfd-82f7-430d-af6e-84d168bc34f5";
in
{
  dconf.settings = {
    "org/gnome/terminal/legacy/profiles:" = {
      default = uuid;
      list = [ uuid ];
    };
    "org/gnome/terminal/legacy/profiles:/:${uuid}" = {
      audible-bell = false;
      background-color = "#1e1e2e";
      bold-is-bright = true;
      cursor-background-color = "#f5e0dc";
      cursor-blink-mode = "on";
      cursor-colors-set = true;
      cursor-foreground-color = "#1e1e2e";
      cursor-shape = "ibeam";
      default-size-columns = 120;
      default-size-rows = 30;
      font = "JetBrainsMono Nerd Font 13";
      foreground-color = "#cdd6f4";
      highlight-background-color = "#1e1e2e";
      highlight-colors-set = true;
      highlight-foreground-color = "#585b70";
      palette = [
        "#45475a"
        "#f38ba8"
        "#a6e3a1"
        "#f9e2af"
        "#89b4fa"
        "#f5c2e7"
        "#94e2d5"
        "#bac2de"
        "#585b70"
        "#f38ba8"
        "#a6e3a1"
        "#f9e2af"
        "#89b4fa"
        "#f5c2e7"
        "#94e2d5"
        "#a6adc8"
      ];
      use-system-font = false;
      use-theme-colors = false;
      visible-name = "BlankUniverse";
    };
  };
}
