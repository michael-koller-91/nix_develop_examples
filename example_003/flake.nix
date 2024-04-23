{
  description = "test_004";

  nixConfig.bash-prompt = "[nix develop]:/\\W$ ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
    nvc.url = "github:michael-koller-91/.dotfiles/main?dir=packages/nvc";
};

  outputs = { self, nixpkgs, nvc }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {

        name = "shell test_004";

        buildInputs = [
            nvc.defaultPackage.x86_64-linux
        ];

        shellHook = ''
          echo "Welcome in $name"
          export FOO="BAR";
        '';

      };
    };
}

