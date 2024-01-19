{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (_: prev: {
            aesthetic-iosevka = pkgs.callPackage ./nix {};
          })
        ];
      };
    in (with pkgs; {
      packages.default = aesthetic-iosevka;
      devShells.default = mkShell {
        buildInputs = [aesthetic-iosevka];
      };
    }));
}
