{
  description = "MyST Parser test devshell";

  outputs = {nixpkgs, ...}: let
    supportedSystems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    devShells = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          just
          (python3.withPackages (ps:
            with ps; [
              sphinx
              sphinx-rtd-theme
              myst-parser
            ]))
        ];
      };
    });
  };

  inputs = {
    nixpkgs.url = "github:loicreynier/nixpkgs/feat-python3plugins-myst-parser-update";
  };
}
