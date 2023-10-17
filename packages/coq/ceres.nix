{ pkgs ? import <nixpkgs> {} }:
(pkgs.coqPackages.mkCoqDerivation rec {
  pname = "coq-ceres";
  releaseRev = "f61b24d48222db0100de19f88c19151a3aeb826f";
  src = pkgs.fetchFromGitHub {
    owner = "Lysxia";
    repo = "coq-ceres";
    rev = "f61b24d48222db0100de19f88c19151a3aeb826f";
    sha256 = "sha256-9vyk8/8IVsqNyhw3WPzl8w3L9Wu7gfaMVa3n2nWjFiA=";
  };
  meta = {
    broken = false;
  };
})
