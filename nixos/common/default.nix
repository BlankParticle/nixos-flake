{ pkgs, ... }: {
  imports = [
    ./boot.nix
    ./local.nix
    ./user.nix
    ./audio.nix
    ./services.nix
    ./fonts.nix
    ./network.nix
  ];
  system.stateVersion = "23.05";
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
