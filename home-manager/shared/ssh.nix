{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        setEnv = {
          "TERM" = "xterm-256color";
        };
      };
    };
  };
}
