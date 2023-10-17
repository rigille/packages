{ pkgs ? import <nixpkgs> {} }:
pkgs.coqPackages.mkCoqDerivation rec {
  pname = "coq-http";
  releaseRev = "83c628198c84bbeb236bb26eca7f9305bc832aef";
  src = pkgs.fetchFromGitHub {
    owner = "liyishuai";
    repo = "coq-http";
    rev = "83c628198c84bbeb236bb26eca7f9305bc832aef";
    sha256 = "sha256-94/HwZbPUgCT9Ws6N+/aSt5eer9O19rBRcVg5lW6dZE=";
  };
  propagatedBuildInputs = [
    pkgs.ocamlPackages.ocamlbuild
    pkgs.opam
    pkgs.coqPackages.QuickChick
    (import ./coq-async-test.nix { pkgs=pkgs; })
  ];
  configurePhase = ''
    export INSTALLDIR=$out
  '';
  meta = {
    broken = false;
  };
}
