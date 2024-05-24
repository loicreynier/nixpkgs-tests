{
  description = "DocArray test devshell";

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
              docarray
              pytorch
              hnswlib
            ]))
        ];
      };
    });
  };

  inputs = {
    nixpkgs.url = "github:loicreynier/nixpkgs/feat-python3-docarray-init-at-0.40";
  };
}
