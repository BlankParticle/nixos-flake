{ imported-modules, username, pkgs, lib, system, ... }:

lib.nixosSystem {
  pkgs.bluez.override = { withExperimental = true; };
  inherit system;
  specialArgs = {
    inherit system pkgs imported-modules username;
  };
  modules = [
    ./hardware.nix
    ./system.nix
    imported-modules.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit pkgs system imported-modules username;
      };
      home-manager.users.${username} = {
        imports = [ ./home.nix ];
      };
    }
  ];
}
