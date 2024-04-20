{
  description = "test_006";

  nixConfig.bash-prompt = "[nix develop]:/\\W$ ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
    nvc.url = path:./nvc;
};

  outputs = { self, nixpkgs, nvc }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in {
        devShells.x86_64-linux.default = pkgs.mkShell {

        name = "shell test_006";

        buildInputs = [
            nvc.defaultPackage.x86_64-linux

            pkgs.python311
            pkgs.python311Packages.pip
            pkgs.python311Packages.virtualenv
        ];

        shellHook = ''
            VENV=.venv
            if test ! -d $VENV; then
                virtualenv $VENV
            fi
            source ./$VENV/bin/activate

            pip install -r requirements.txt
        '';

        };
    };
}

