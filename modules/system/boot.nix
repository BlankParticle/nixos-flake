{ pkgs, ... }: {
  boot = {
    consoleLogLevel = 2;
    plymouth = {
      enable = true;
      themePackages = [ (pkgs.catppuccin-plymouth.override ({ variant = "mocha"; })) ];
      theme = "catppuccin-mocha";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "rd.udev.log-level=3"
      "rd.systemd.show_status=false"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];
    initrd = {
      kernelModules = [ "amdgpu" ];
      verbose = false;
    };
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
        theme = pkgs.callPackage ../../pkgs/catppuccin-grub-theme { };
        splashImage = null;
      };
    };
  };
}
