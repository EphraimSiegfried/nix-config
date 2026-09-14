{
  flake.modules.homeManager.ssh = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "Host qew" = {
          Hostname = "51.154.57.9";
          Port = 1990;
        };
        "Host o11y" = {
          Hostname = "51.154.57.9";
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
