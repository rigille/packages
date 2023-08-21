{ pkgs ? import <nixpkgs> {} }:
let
  telegramBotApi = pkgs.fetchFromGitHub {
    owner = "tdlib";
    repo = "telegram-bot-api";
    rev = "c5b8e34cd31276c9bfa4940c96adfd757542b9ce";
    sha256 = "6242fda8fe2db542af91a1368dfbd6f1301a217f7690bbbd82713b8aea5a8abb";
    fetchSubmodules = true;
  };
in
pkgs.stdenv.mkDerivation {
  name = "my-project";
  src = telegramBotApi;
  buildInputs = [ pkgs.cmake pkgs.openssl pkgs.zlib pkgs.gperf ];

  configurePhase = ''
    mkdir build
    cd build
    cmake -DCMAKE_PREFIX_PATH='${pkgs.zlib}' -DCMAKE_INSTALL_PREFIX=$out ..
  '';
  buildPhase = ''
    cmake --build .
  '';
}
