{
  description = "Example 001";
  nixConfig.bash-prompt = "[nix develop]:/\\W$ ";
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/23.11"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
      fooScript = pkgs.writeScriptBin "foo.sh" ''
        #!/bin/sh
        echo $FOO
      '';
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "Example 001 build environment";
        buildInputs = [
          fooScript
        ];
        shellHook = ''
          echo "Welcome in $name"
          export FOO="BAR"
        '';
      };
    };
}

