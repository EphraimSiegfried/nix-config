{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    uv
    fd
    ripgrep
    devenv
  ];
}
