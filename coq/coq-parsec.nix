{ pkgs ? import <nixpkgs> {} }:
(pkgs.coqPackages.mkCoqDerivation rec {
  pname = "coq-parsec";
  releaseRev = "f61b24d48222db0100de19f88c19151a3aeb826f";
  src = pkgs.fetchFromGitHub {
    owner = "liyishuai";
    repo = "coq-parsec";
    rev = "f42571184b2f6bd74ae1d481c5851d4364bf6f70";
    sha256 = "sha256-Rl3QT9ZxyU0xyBGoLxzm1nrAv9olOB6QvCOQnO6cmsM=";
  };
  propagatedBuildInputs = [
    pkgs.coqPackages.coq-ext-lib
    (import ./coq-ceres.nix { pkgs=pkgs; })
  ];
  meta = {
    broken = false;
  };
})
