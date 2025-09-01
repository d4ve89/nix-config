# DOOM EMACS system configuration
{ config, pkgs, lib, inputs, ... }: {

  nixpkgs.overlays = 
  	[ inputs.nix-doom-emacs-unstraightened.overlays.default ];

  environment.systemPackages = [
	(pkgs.emacsWithDoom {
	 emacs = pkgs.emacs-macport;
 	 doomDir = ../../../../dotfiles/config/doom;
	 tangleArgs = "--all config.org";
	 extraPackages = epkgs: [ ];
  	 doomLocalDir = "~/.local/share/nix-doom";})
  ];

}
