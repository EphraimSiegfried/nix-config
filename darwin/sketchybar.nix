{ pkgs, ... }: {
  services.sketchybar = {
    enable = true;
    extraPackages = with pkgs; [
      jq
      sketchybar-app-font
    ];
  };
}
