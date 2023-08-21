{ pkgs ? import <nixpkgs> {} }:
pkgs.coqPackages.mkCoqDerivation rec {
  pname = "coq-async-test";
  releaseRev = "adb8f18433482f951419e0c7f66b78270fdcb22d";
  src = pkgs.fetchFromGitHub {
    owner = "liyishuai";
    repo = "coq-async-test";
    rev = "adb8f18433482f951419e0c7f66b78270fdcb22d";
    sha256 = "sha256-J2h0CfSfo8MjT+rI0E9qKTrO7HmpeDCReCu/z1KbUhI=";
  };
  propagatedBuildInputs = [
    pkgs.coqPackages.QuickChick
    pkgs.coqPackages.ITree
    (import ./coq-json.nix { pkgs=pkgs; })
  ];
  meta = {
    broken = false;
  };
}
