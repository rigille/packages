{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "message";
  src = ./.;
  buildInputs = with pkgs; [
      gcc
  ];
  propagatedBuildInputs = [ pkgs.glibcLocales ];
  buildPhase = ''
    gcc main.c -o message
  '';
  installPhase = ''
    mkdir -p $out/bin
    mv message $out/bin
  '';
}
