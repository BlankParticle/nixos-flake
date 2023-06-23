{ ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.plugins = [ "git" ];
    oh-my-zsh.theme = "robbyrussell";
    historySubstringSearch.enable = true;
    shellAliases = {
      cls = "clear";
      vsc = "code - r";
      q = "exit";
    };
  };
}
