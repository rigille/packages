{
  description = "My personal package collection";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
            coq-http = import ./coq/coq-http.nix { pkgs=pkgs; };
            coq-async-test = import ./coq/coq-async-test.nix { pkgs=pkgs; };
            coq-ceres = import ./coq/coq-ceres.nix { pkgs=pkgs; };
            coq-json = import ./coq/coq-json.nix { pkgs=pkgs; };
            coq-menhirlib = import ./coq/coq-menhirlib.nix { pkgs=pkgs; };
            coq-parsec = import ./coq/coq-parsec.nix { pkgs=pkgs; };
            telegram-bot-api = import ./telegram/telegram-bot-api.nix { pkgs=pkgs; };
        };
      });
}
