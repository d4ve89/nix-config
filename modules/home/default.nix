{ pkgs, lib, ... }: {

  imports = [
    ./editor
    ./shell
    ./term
    ./theme
    ./wm
  ];
}
