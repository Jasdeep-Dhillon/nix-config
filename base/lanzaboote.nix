{ inputs, lib, ... }:
{
  flake.nixosModules.lanzaboote = {
    imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
    boot.loader.systemd-boot.enable = lib.mkForce false;

    boot.lanzaboote = {
      enable = true;
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
        autoReboot = true;
      };
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
