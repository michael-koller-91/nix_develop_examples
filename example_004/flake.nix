{
  description = "Example 004";

  nixConfig.bash-prompt = "[nix develop]:/\\W$ ";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/23.11"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in {
        devShells.x86_64-linux.default = pkgs.mkShell {

        name = "Example 004 build environment";

        buildInputs = [
            pkgs.python311
            pkgs.python311Packages.pip
            pkgs.python311Packages.virtualenv

            # this is something numpy needs
            pkgs.zlib
        ];

        shellHook = ''
            echo "Welcome in $name"

            # create a virtual environment if it does not exist yet
            VENV=.venv
            if test ! -d $VENV; then
                virtualenv $VENV
            fi
            # activate it
            source ./$VENV/bin/activate

            # will not install anything if all packages are already installed
            pip install -r requirements.txt

            # this is something numpy needs
            export LD_LIBRARY_PATH="${pkgs.zlib}/lib"
        '';

        };
    };
}

