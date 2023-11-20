{ pkgs, ... }: {
  boot = {
    plymouth = {
      enable = true;
      themePackages = [ (pkgs.catppuccin-plymouth.override ({ variant = "mocha"; })) ];
      theme = "catppuccin-mocha";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];
    supportedFilesystems = [ "ntfs" ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        default = "saved";
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        configurationLimit = 10;
      };
    };
  };
}
