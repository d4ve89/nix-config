{ pkgs, lib, ... }: {

  imports = [
    ./editor
    ./shell
    ./media
    ./term
    ./theme
    ./wm
  ];
}
