{ pkgs, config, ... }: {
  home.packages = [ pkgs.neofetch ];

  home.file."${config.xdg.configHome}/neofetch/config.conf" = {
    text = ''
      print_info() {
          info title
          info underline
          info "OS" distro
          info "Kernel" kernel
          info "Uptime" uptime
          info "Packages" packages
          info "Shell" shell
          info "Resolution" resolution
          info "DE" de
          info "WM" wm
          info "WM Theme" wm_theme
          info "Theme" theme
          info "Icons" icons
          info "Terminal" term
          info "Terminal Font" term_font
          info "CPU" cpu
          info "GPU" gpu
          info "Memory" memory
          info "Song" song
          [[ "$player" ]] && prin "Music Player" "$player"
          info cols
      }
      kernel_shorthand="on"
      distro_shorthand="on"
      os_arch="on"
      uptime_shorthand="tiny"
      memory_percent="on"
      memory_unit="mib"
      package_managers="on"
      shell_path="off"
      shell_version="on"
      speed_type="bios_limit"
      speed_shorthand="on"
      cpu_brand="on"
      cpu_speed="on"
      cpu_cores="logical"
      cpu_temp="off"
      gpu_brand="on"
      gpu_type="all"
      refresh_rate="on"
      gtk_shorthand="on"
      gtk2="on"
      gtk3="on"
      de_version="on"
      music_player="auto"
      song_format="%title% | %artist%"
    '';
  };
}
