
{pkgs,...}:
# let
#   nixpkgs = builtins.fetchTarball {
#     url = "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz";
#   };

# pkgs = import nixpkgs { config = {}; };
# in
pkgs.stdenv.mkDerivation {
  pname = "glacier";
  version = "1.0";
  
  # src = ./.;
  src = pkgs.fetchFromGitHub {
    owner = "namishh";
    repo = "crystal";
    rev = "glacier";
    hash = "sha256-v1HNAoPBHVgps2vZ0Vce61Olnv8vyRmQT/oulhB4rjo=";
  };

  buildPhase = ''

  '';

   installPhase = ''
    patchShebangsAuto $src
    mkdir -p $out
    cp -r $src/* $out

  '';

  # postInstall = ''
  
    # pathsToLink = [ /bin /usr /lib];

  #   # --replace-fail "a string containing spaces" "some other text" \
  #   # --subst-var someVar
  # '';

  meta = {
    # mainProgram = "";
    description = "Session files and Executables";
    homepage = "https://github.com/regolith-linux/regolith-session";
    license = pkgs.lib.licenses.gpl3Plus;
  };
}