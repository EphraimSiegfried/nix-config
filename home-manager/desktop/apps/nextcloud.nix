{ pkgs, config, ... }:
let
  domain = "https://cloud.qew.ch";
  user = "siegi";
  local_path = "~/Nextcloud";
in
{
  home.packages = with pkgs; [
    nextcloud-client
  ];

  sops.secrets."nextcloud/admin_pw" = { };
  sops.templates.".netrc".content = ''default
    login ${user}
    password ${config.sops.placeholder."nextcloud/admin_pw"}
  '';
  # systemd.user = {
  #   services.nextcloud-autosync = {
  #     Unit = {
  #       Description = "Auto sync Nextcloud";
  #       After = "network-online.target";
  #     };
  #     Service = {
  #       Type = "simple";
  #       ExecStart = "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -u ${user} -p ${password} ${local_path} ${domain}";
  #       TimeoutStopSec = "180";
  #       KillMode = "process";
  #       KillSignal = "SIGINT";
  #     };
  #     Install.WantedBy = [ "multi-user.target" ];
  #   };
  #   timers.nextcloud-autosync = {
  #     Unit.Description = "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 60 minutes";
  #     Timer.OnBootSec = "5min";
  #     Timer.OnUnitActiveSec = "60min";
  #     Install.WantedBy = [ "multi-user.target" "timers.target" ];
  #   };
  #   startServices = true;
  # };
}
