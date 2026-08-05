{ ... }:
{
  flake.nixosModules.bluetooth = { config, lib, ... }: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Name = lib.strings.toSentenceCase config.networking.hostName;
          Experimental = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
    hardware.enableAllFirmware = true;
  };
}
