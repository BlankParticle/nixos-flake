{ imported-modules, system, ... }:
let
  spicetify-pkgs = imported-modules.spicetify-nix.packages.${system}.default;
in
{
  imports = [ imported-modules.spicetify-nix.homeManagerModule ];
  programs.spicetify =
    {
      enable = true;
      theme = spicetify-pkgs.themes.catppuccin-mocha;
      colorScheme = "mauve";

      enabledExtensions = with spicetify-pkgs.extensions; [
        fullAppDisplay
        shuffle
        hidePodcasts
        adblock
        history
        genre
        songStats
      ];
      enabledCustomApps = with spicetify-pkgs.apps; [
        lyrics-plus
      ];
    };
}
