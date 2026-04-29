{ ... }:
{
  flake.nixosModules.legion = {
    fileSystems."/media/Storage" = {
      device = "/dev/disk/by-uuid/7050261a-762a-443d-a19f-b5b4d23049d3";
      fsType = "btrfs";
    };

    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 32 * 1024;
      }
    ];
  };
}
