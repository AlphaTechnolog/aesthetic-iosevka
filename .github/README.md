# Aesthetic Iosevka

A mirror of `github:rxyhn/yoru` misc/fonts/Aesthetic Iosevka

## Nix Support

If you're using nix or nixos, you can install this font easily by using the
provided flake in this repository.

> Take the next dev shell using flake-utils as reference

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    aesthetic-iosevka.url = "github:alphatechnolog/aesthetic-iosevka";
  };

  outputs = { self, nixpkgs, flake-utils, ... } @inputs: flake-utils.lib.eachDefaultSystem(system: let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (_: prev: {
          aesthetic-iosevka = inputs.aesthetic-iosevka.packages.${prev.system}.default;
        })
      ];
    };
  in (with pkgs; {
    devShells.default = mkShell {
      buildInputs = [aesthetic-iosevka];
    };
  }));
}
```

And if you're wanting to install the font in your system, if using nixos, you could use the next
code as reference:

```nix
{
  fonts.packages = [pkgs.aesthetic-iosevka];
}
```

for installing aesthetic-iosevka in your system, note that you would have to add the overlay
as shown in the dev shell example in order to be able to call `pkgs.aesthetic-iosevka`.