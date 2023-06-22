{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/boot" =
      {
        device = "/dev/disk/by-uuid/E8A9-7BDE";
        fsType = "vfat";
      };
    "/" =
      {
        device = "/dev/disk/by-label/NixOS";
        fsType = "ext4";
      };
    "/home/blank/Data" =
      {
        device = "/dev/disk/by-label/Data";
        fsType = "ntfs-3g";
        options = [ "rw" "uid=blank" "dmask=022" "fmask=133" ];
      };
  };

  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
