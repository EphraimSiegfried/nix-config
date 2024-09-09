{
  launchd.agents = {
    onnetworkchange = {
      script = builtins.readFile ./netw-vol.sh;
      serviceConfig = {
        WatchPaths = [
          # Files that change when changing networks
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
