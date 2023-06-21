{ pkgs, ... }:
{

  imports =
    [
      ./hardware-configuration.nix
    ];

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
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };

  fileSystems."/home/blank/Data" =
    {
      device = "/dev/disk/by-label/Data";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=blank" "dmask=022" "fmask=133" ];
    };

  time.timeZone = "Asia/Kolkata";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults !tty_tickets\nDefaults pwfeedback";
  };

  environment = {
    gnome.excludePackages = with pkgs.gnome; [
      baobab # disk usage analyzer
      cheese # photo booth
      epiphany # web browser
      gedit # text editor
      simple-scan # document scanner
      totem # video player
      yelp # help viewer
      geary # email client
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-system-monitor
      gnome-weather
      gnome-disk-utility
      pkgs.gnome-connections
      pkgs.gnome-text-editor
      pkgs.gnome-tour
    ];

    systemPackages = with pkgs; [
      curl
      wget
      speedtest-rs
      gnome.gnome-tweaks
    ];
  };

  users = {
    users.blank = {
      isNormalUser = true;
      description = "Blank Particle";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    defaultUserShell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  services = {
    syncthing = {
      enable = true;
      user = "blank";
      dataDir = "/home/blank/Data/Sync";
      configDir = "/home/blank/.config/syncthing";
    };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      layout = "us";
      xkbVariant = "";
      excludePackages = [ pkgs.xterm ];
    };
    printing.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    openssh.enable = true;
    pcscd.enable = true;
    gnome.gnome-browser-connector.enable = true;
  };

  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
      jetbrains-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
    gnome-terminal.enable = true;
  };

  networking = {
    hostName = "BlankUniverse";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  system.stateVersion = "23.05";
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
