{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "kidex";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "Kirottu";
    repo = pname;
    rev = "d1aad24";
    sha256 = "sha256-LgY4hYJOzGSNZxOK1O4L6A+4/qgv4dhouKo0nLKK25A=";
  };

  cargoHash = "sha256-BkpiJZZ83RrSSmbxM/TBl8rx5wIxLwYDZvFWdTwlUSI=";

  meta = {
    description = "A simple file indexing service";
    homepage = "https://github.com/Kirottu/kidex";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
