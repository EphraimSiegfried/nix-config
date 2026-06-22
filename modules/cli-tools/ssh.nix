{
  flake.modules.homeManager.ssh = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "Host gitlab-tds" = {
          Hostname = "madra-test.cscs.ch";
          User = "root";
        };
        "Host gitlab-dev" = {
          Hostname = "madra-dev.cscs.ch";
          User = "root";
        };
        "Host gitlab-tds-new" = {
          Hostname = "blenio-test.cscs.ch";
          User = "root";
        };
        "Host confluence-tds" = {
          Hostname = "ascona-tds.cscs.ch";
          User = "root";
        };
        "Host jira-tds" = {
          Hostname = "agra-tds.cscs.ch";
          User = "root";
        };
        "Host qew" = {
          Hostname = "51.154.57.9";
          Port = 1990;
        };
        "Host o11y" = {
          Hostname = "siegi.internet-box.ch";
          Port = 2001;
        };
        "Host *" = {
          SetEnv = {
            TERM = "xterm-256color";
          };
        };
      };
    };
    services.ssh-agent.enable = true;
  };
}
