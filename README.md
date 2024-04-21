# `nix develop` Examples

In this repository, I collect `flake.nix` files which demonstrate various `nix develop` features.

# How to run the examples

Every `example_*` folder contains a `flake.nix`.
Navigate into one of the folders and run `nix develop`.
This builds what is specified in the flake and enters a shell in which the build outputs are available.

# Examples

## example_001

* Set the environment variable `FOO`.
* Create the script `foo.sh` which prints the value of the variable `FOO`. It can be run as `foo.sh`.

## example_005

* Create a Python virtual environment and install the packages listed in `requirements.txt`.
* In particular, make `numpy` work by exporting a variable it needs.

