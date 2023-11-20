{ pkgs, ... }: {
  imports =
    map (module: ../../modules/system/${module}.nix) [
      "boot"
      "local"
      "user"
      "audio"
      "services"
      "fonts"
      "network"
      "programs"
    ] ++ [../../modules/gnome/system.nix];
  system.stateVersion = "23.05";
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
