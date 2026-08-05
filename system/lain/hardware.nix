{ ... }:
{
  flake.nixosModules.lain =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {

      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/d68086d2-f9ea-40a8-8c77-3707404eaa29";
        fsType = "ext4";
      };
      fileSystems."/media/Storage" = {
        device = "/dev/disk/by-uuid/1eb039e4-9e9c-4edd-8cb2-bac84f1d32b4";
        fsType = "btrfs";
      };
      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/1B9C-968E";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };
      swapDevices = [
        { device = "/dev/disk/by-uuid/3c23bedb-290c-443b-9a88-4c60f115c3f4"; }
      ];
    };
}
