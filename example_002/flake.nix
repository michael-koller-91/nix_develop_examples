{
  description = "Example 002";

  nixConfig.bash-prompt = "[nix develop]:/\\W$ ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
    hello-repeater.url = "path:./package";
  };

  outputs = { self, nixpkgs, hello-repeater }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {

        name = "Example 002 build environment";

        buildInputs = [
          hello-repeater.defaultPackage.x86_64-linux
        ];

        shellHook = ''
          echo "Welcome in $name"
        '';
      };
    };
}

