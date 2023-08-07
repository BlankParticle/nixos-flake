{ ... }:
{
  imports = [
    ../common/home.nix
    ../../desktop-env/gnome/home.nix
  ]
  ++ map (program: ../../home-manager/${program}.nix)
    [
      "zsh"
      "git"
      "starship"
      "spicetify"
      "gnome-terminal"
      "direnv"
      "keepassxc"
      "discord"
      "neofetch"
      "btop"
      "obs-studio"
    ];
}
