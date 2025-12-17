{ description = "A Course on Surreal Numbers";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    scribe = {
      url = "github:lentilus/typst-scribe";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    system = "x86_64-linux";
    pkgs   = import nixpkgs { inherit system; };

  in {
    devShells.${system}.default = let
      scribe   = inputs.scribe.packages.${system}.default;
      ctheorem = pkgs.typstPackages.ctheorems;
    in pkgs.mkShell {
      buildInputs = [
        pkgs.typst
        pkgs.tinymist # an lsp for typst
      ];

      shellHook = ''
        FLAKE_ROOT="$(git rev-parse --show-toplevel)"
        export TYPST_ROOT=$FLAKE_ROOT
        # export TYPST_FEATURES="html"

        CACHE_DIR="$FLAKE_ROOT/.typst-cache"
        if [ ! -d "$CACHE_DIR" ]; then
          mkdir -p "$CACHE_DIR/preview"
          cp -r ${scribe}/lib/typst-packages/* "$CACHE_DIR/preview/"
        fi
        export TYPST_PACKAGE_CACHE_PATH="$CACHE_DIR"

        echo "typst version : ''$(typst --version)"
      '';
    };
  };
}
