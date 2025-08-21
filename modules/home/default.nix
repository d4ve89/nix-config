{ pkgs, lib, ... }: {

  imports = [
    ./shell
    ./editor
    ./wm
    ./theme
  ];
}
