{
  description = "My personal package collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        create_package_set = base_directory:
          let
            path_set = (builtins.readDir base_directory);
            path_list = builtins.attrNames path_set;
          in
            builtins.foldl'
              (accumulator: name:
                let
                  kind = builtins.getAttr name path_set;
                  new_path = /. + base_directory + /${name};
                  entry =
                    if kind == "directory" then
                      (create_package_set new_path)
                    else
                      (import new_path { pkgs=pkgs; });
                  corrected_name =
                    if kind == "directory" then
                      name
                    else
                      let length = builtins.stringLength name; in
                      builtins.substring 0 (length - 4) name;
                in
                  accumulator // { ${corrected_name} = entry; })
              {}
              path_list;
      in rec {
        packages = create_package_set ./packages;
      });
}
