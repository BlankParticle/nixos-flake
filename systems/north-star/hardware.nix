{ config, lib, modulesPath, metadata, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
    kernelModules = [
      "kvm-amd"
      "v4l2loopback"
      "snd-aloop"
    ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
    '';
  };

  fileSystems = {
    "/boot" =
      {
        device = "/dev/disk/by-label/EFI";
        fsType = "vfat";
      };
    "/" =
      {
        device = "/dev/disk/by-label/NixOS";
        fsType = "ext4";
      };
    "/home/${metadata.username}/Data" =
      {
        device = "/dev/disk/by-label/Data";
        fsType = "ntfs-3g";
        options = [ "rw" "uid=${metadata.username}" "dmask=022" "fmask=133" ];
      };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault metadata.system;
  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    opengl = {
      driSupport = true;
      enable = true;
    };
  };
}
