{ config, lib, pkgs, modulesPath, ... }:

{ 
  imports = [ ];
  
  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7d3a3aeb-d137-45b5-b3d6-d6bd6f50e88d";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-5fc85265-b66f-418f-826e-a2f11b7b81662".device = "/dev/disk/by-uuid/5fc85265-b66f-418f-826e-a2f11b7b81662";
  
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A586-E2F7";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/e082712-cac6-47c9-a279-c4351969f22a"; 
    }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}

