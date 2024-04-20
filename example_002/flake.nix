{
  description = "Package the hello repeater.";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.hello-repeater =
      let pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
      in pkgs.stdenv.mkDerivation {
        pname = "hello-repeater";
        version = "1.0.0";
        src = pkgs.fetchgit {
          url = "https://github.com/breakds/flake-example-hello-repeater.git";
          rev = "c++-code-alone";
          sha256 = "sha256-/3tT3jBmWLaENcBRQhi2o3DHbBp2yiYsq2HMD/OYXNU=";
        };

        nativeBuildInputs = with pkgs; [
          cmake
        ];
      };

    # Specify the default package
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello-repeater; # <- add this
  };
}
