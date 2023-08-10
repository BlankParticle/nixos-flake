{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
        withTTS = false;
      })
      # Discord Krisp Patcher
      (callPackage ../pkgs/discord-krisp-patcher { })
    ];
  };
}
