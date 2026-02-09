{ pkgs ? import <nixpkgs> {} }:
let
  leela-chess-zero = pkgs.fetchFromGitHub {
    owner = "danegraphics";
    repo = "lc0-Dane";
    rev = "37930b63eb1c57045e43d65138fa685cebd0b806";
    sha256 = "sha256-dBBeLnWTFWkO+aDHFQKQCSgwOy/rssQjmWPl7zah6dY=";
    fetchSubmodules = true;
  };
in
pkgs.stdenv.mkDerivation {
  name = "lc0";
  src = leela-chess-zero;
  buildInputs = with pkgs; [
    git
    python3
    eigen
    openblas
    zlib
    gtest
    ninja
  ];
  postPatch = ''
      patchShebangs --build .
  '';
  nativeBuildInputs = with pkgs; [
    meson
    pkg-config
  ];
  mesonFlags = [
    "-Dopenblas_libdirs=${pkgs.openblas.out}/lib"
    "-Dopenblas_include=${pkgs.openblas.dev}/include"
    "-Dblas=true"
    "-Dmetal=disabled"
  ];
}
