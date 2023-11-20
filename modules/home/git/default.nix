{ ... }: {
  programs.git = {
    enable = true;
    userName = "BlankParticle";
    userEmail = "blankparticle@gmail.com";
    signing = {
      signByDefault = true;
      key = "0ACE126D7B359261";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
