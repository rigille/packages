{ pkgs ? import <nixpkgs> {} }:
let
  leela-chess-zero = pkgs.fetchFromGitHub {
    owner = "LeelaChessZero";
    repo = "lc0";
    rev = "afdd67c2186f1f29893d495750661a871f7aa9ac";
    sha256 = "sha256-VUTUTYvvE2kGhL1EDmidV2J4/NcNcJb3oh81jsYJyfo=";
    fetchSubmodules = true;
  };
in
pkgs.stdenv.mkDerivation {
  name = "leela-chess-zero";
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
