{
  launchd.agents = {
    onnetworkchange = {
      script = builtins.readFile ./netw-vol.sh;
      serviceConfig = {
        WatchPaths = [
          /etc/resolv.conf
          /var/run/resolv.conf
          /private/var/run/resolv.conf
        ];
        LowPriorityIO = true;
        RunAtLoad = true;
      };
    };
  };
}
