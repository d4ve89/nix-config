#{ pkgs ? import <nixpkgs> {}, ...}: rec {
{ pkgs }: {
  activinspire = pkgs.callPackage ./activinspire {};
}
