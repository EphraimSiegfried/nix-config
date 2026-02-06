{ lib, ... }:
{
  options.primaryUser = lib.mkOption {
    type = lib.types.str;
    default = "siegi";
  };
}
