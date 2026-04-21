# Can be tested like this
# nix build \
#  --impure \
#  --expr '(with import <nixpkgs> { system = "aarch64-linux"; }; runCommand "foo" {} "uname -a > $out")'
{
  flake.modules.darwin.linux-builder = {
    nix.linux-builder = {
      enable = true;
      ephemeral = true;
      maxJobs = 4;
      config = {
        virtualisation = {
          darwin-builder = {
            diskSize = 40 * 1024;
            memorySize = 8 * 1024;
          };
          cores = 6;
        };
      };
    };
  };
}
