# `nix develop` Examples

In this repository, I collect `flake.nix` files which demonstrate various `nix develop` features.

# How to run the examples

Every `example_*` folder contains a `flake.nix`.
Navigate into one of the folders and run `nix develop`.
This builds what is specified in the flake and enters a shell in which the build outputs are available.

# Examples

## example_001

* Set the environment variable `FOO`.
* Create the script `foo.sh` which prints the value of the variable `FOO`. It can be executed with `foo.sh`.

## example_002

* Use a local `flake.nix` (in a subfolder) as input of the main `flake.nix`.
* The local `flake.nix` leads to the compilation of `hello-repeater` which then is available in the `nix develop` environment. It can be executed with `hello-repeater 1`.
* `hello-repeater` is from (this Github repository)[https://github.com/breakds/flake-example-hello-repeater].

## example_003

* Use a `flake.nix` in a subfolder of a remote repository as input of the main `flake.nix`.
* The remote `flake.nix` makes `nvc` available in the `nix develop` environment. For example: `nvc --version`.

## example_005

* Create a Python virtual environment and install the packages listed in `requirements.txt`.
* In particular, make `numpy` work by exporting a variable it needs.

