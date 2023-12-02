{
  description = "aoc23-bqn";

  inputs = {
    nixpkgs.url = "nixpkgs";
    bqnlsp.url = "sourcehut:~detegr/bqnlsp";
  };

  outputs = {
    self,
    nixpkgs,
    bqnlsp,
  }: let
    forAllSystems = inFunc:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ]
      (system:
        inFunc (
          import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [];
          }
        ));
  in rec {
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    packages = forAllSystems (pkgs: {
      bqnlsp = bqnlsp.packages.${pkgs.system}.lsp;
    });

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        buildInputs = [
          pkgs.cbqn
          pkgs.nil
          packages.${pkgs.system}.bqnlsp
        ];

        # Change the prompt to show that you are in a devShell
        shellHook = "export PS1='\\e[1;34mdev > \\e[0m'";
      };
    });
  };
}
