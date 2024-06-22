{
  description = "Spriggit test devshell";

  outputs = {
    nixpkgs,
    nixpkgs-lor,
    ...
  }: let
    supportedSystems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    nixpkgsFor = forAllSystems (system:
      import nixpkgs {
        inherit system;
        overlays = [
          nixpkgs-lor.overlays.default
        ];
      });
  in {
    devShells = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          just
          spriggit
        ];
      };
    });
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-lor.url = "github:loicreynier/nixpkgs-lor/feat-spriggit-update";
  };
}
