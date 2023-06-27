{ ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    shellAliases = {
      cls = "clear";
      vsc = "code - r";
      q = "exit";
    };
  };
}
