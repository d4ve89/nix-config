#{ pkgs ? import <nixpkgs> {}, ...}: rec {
{ pkgs }: {
  activinspire = pkgs.callPackage ./activinspire {};
  yabai = pkgs.callPackage ./yabai {};
}
