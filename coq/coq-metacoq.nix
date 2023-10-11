{ pkgs ? import <nixpkgs> {} }:
pkgs.coqPackages.mkCoqDerivation rec {
  pname = "metacoq";
  releaseRev = "v1.2-8.17";
  src = pkgs.fetchFromGitHub {
    owner = "MetaCoq";
    repo = "metacoq";
    rev = "v1.2-8.17";
    sha256 = "sha256-enitM++Z6qs2iGJcVwbyKjo73lIPlD6IaurPObDtWxI=";
  };
  propagatedBuildInputs = [
    pkgs.coq
    pkgs.coqPackages.equations
    pkgs.ocamlPackages.findlib
    pkgs.ocamlPackages.stdlib-shims
    pkgs.ocaml
  ];
  configurePhase = ''
    #find . -name '*.sh' | xargs patchShebangs --build
    patchShebangs --build configure.sh
    patchShebangs --build erasure-plugin/clean_extraction.sh
    patchShebangs --build checktodos.sh
    patchShebangs --build make-opam-files.sh
    patchShebangs --build dependency-graph/generate-depgraph.sh
    patchShebangs --build pcuic/clean_extraction.sh
    patchShebangs --build test-suite/plugin-demo/gen-src/to-lower.sh
    patchShebangs --build safechecker-plugin/clean_extraction.sh
    patchShebangs --build template-coq/gen-src/to-lower.sh
    patchShebangs --build template-coq/update_plugin.sh
    ./configure.sh local
  '';
  meta = {
    broken = false;
  };
}
