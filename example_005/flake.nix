{
  description = "test_005";

  nixConfig.bash-prompt = "[nix develop]:/\\W$ ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
};

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in {
        devShells.x86_64-linux.default = pkgs.mkShell {

        name = "shell test_005";

        buildInputs = [
            pkgs.python311
            pkgs.python311Packages.pip
            pkgs.python311Packages.virtualenv

            # this is something numpy needs
            pkgs.zlib
        ];

        shellHook = ''
            VENV=.venv
            if test ! -d $VENV; then
                virtualenv $VENV
            fi
            source ./$VENV/bin/activate

            pip install -r requirements.txt

            # this is something numpy needs
            export LD_LIBRARY_PATH="${pkgs.zlib}/lib"
        '';

        };
    };
}

