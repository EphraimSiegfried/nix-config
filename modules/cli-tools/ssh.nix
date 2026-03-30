{
  flake.modules.homeManager.ssh = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        gitlab-tds = {
          host = "gitlab-tds";
          hostname = "madra-test.cscs.ch";
          user = "root";
        };
        gitlab-dev = {
          host = "gitlab-dev";
          hostname = "madra-dev.cscs.ch";
          user = "root";
        };
        confluence-tds = {
          host = "confluence-tds";
          hostname = "ascona-tds.cscs.ch";
          user = "root";
        };
        jira-tds = {
          host = "jira-tds";
          hostname = "agra-tds.cscs.ch";
          user = "root";
        };
        qew = {
          host = "qew";
          hostname = "51.154.57.9";
          port = 1990;
        };
        "*" = {
          setEnv = {
            "TERM" = "xterm-256color";
          };
        };
      };
    };
  };
}
