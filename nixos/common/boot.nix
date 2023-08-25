{ pkgs, ... }: {
  boot = {
    plymouth.enable = true;
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
