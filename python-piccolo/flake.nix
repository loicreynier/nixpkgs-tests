{
  description = "Piccolo Sphinx theme test devshell";

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
              piccolo-theme
            ]))
        ];
      };
    });
  };

  inputs = {
    nixpkgs.url = "github:r-ryantm/nixpkgs/auto-update/python311Packages.piccolo-theme";
  };
}
