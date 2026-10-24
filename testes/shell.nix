{ pkgs ? import <nixpkgs> {} }:

let
  cross = pkgs.pkgsCross.riscv32-embedded;
in
pkgs.mkShell {
    nativeBuildInputs = [
     cross.buildPackages.gcc 
     cross.buildPackages.binutils
     cross.buildPackages.qemu
     cross.buildPackages.gdb
     cross.buildPackages.gnumake
    ];
  }
