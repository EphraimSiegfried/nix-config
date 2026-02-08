{ lib, ... }:

let
  userOpts =
    { ... }:
    {
      options = {
        username = lib.mkOption {
          type = lib.types.str;
          default = "siegi";
        };
        firstName = lib.mkOption {
          type = lib.types.str;
          default = "Ephraim";
        };
        lastName = lib.mkOption {
          type = lib.types.str;
          default = "Siegfried";
        };
        email = lib.mkOption {
          type = lib.types.str;
          default = "ephraim.siegfried@proton.me";
        };
        publicSSHKeys = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "A list of public SSH keys for the user.";
        };
        timeZone = lib.mkOption {
          type = lib.types.str;
          default = "Europe/Zurich";
        };
      };
    };
in
{
  options.primaryUser = lib.mkOption {
    type = lib.types.submodule userOpts;
    default = { };
  };
}
