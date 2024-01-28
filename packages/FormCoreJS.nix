{ pkgs ? import <nixpkgs> {} }:
let
  FormCoreJS = pkgs.fetchFromGitHub {
    owner = "rigille";
    repo = "FormCoreJS";
    rev = "454c4304e5448bfe267f2191763425f0573b9851";
    sha256 = "sha256-xR8H6vFf3oXhMfK8+0gWeYY7nUgyC/zcST22ikci0p4=";
  };
in
pkgs.stdenv.mkDerivation rec {
  pname = "fmc";
  version = "0.1.95";
  src = FormCoreJS;
  propagatedBuildInputs = [ pkgs.nodejs_20 ];
  installPhase = ''
    mkdir -p $out/bin
    cp *.js $out/bin
    cp package.json $out/bin
    ln -s $out/bin/main.js $out/bin/fmc
  '';
}
