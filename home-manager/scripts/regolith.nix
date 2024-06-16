{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  glib,
  glibc,
  gvfs,
  dconf,
  rustc,
}:

rustPlatform.buildRustPackage {
  pname = "regolith-powerd";
  version = "3.0";
  
  src = fetchFromGitHub {
    owner = "regolith-linux";
    repo = "regolith-powerd";
    rev = "r3_0";
    hash = "sha256-u+EknvU/UdTv4iov0pkdb39bd+EgJk90buG1ZHK1R5s=";
  };

  cargoHash = "sha256-OL8D7J07kE6SDao6EWvb2LNHTltbXQ0ITnS+i432fUU=";

  nativeBuildInputs = [ pkg-config rustc glibc gvfs dconf];

  buildInputs = [ glib ];

  meta = {
    mainProgram = "regolith-powerd";
    description = "Daemon to sync gsd power settings with Regolith on Wayland. Provides idle state functionality and sets power button action";
    homepage = "https://github.com/regolith-linux/regolith-powerd";
    license = lib.licenses.gpl3Plus;
  };
}