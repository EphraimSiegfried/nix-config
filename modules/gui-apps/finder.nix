{
  flake.modules.darwin.finder = {
    system.defaults.finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      _FXShowPosixPathInTitle = true;
      NSGlobalDomain.AppleShowAllExtensions = true;
    };
  };
}
