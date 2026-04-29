{ ... }:
{
  flake.nixosModules.lain = {
    services.nfs.server = {
      enable = true;
      exports = ''
        /export           192.168.2.*(rw,fsid=0,no_subtree_check)
        /export/Storage   192.168.2.*(rw,nohide,insecure,no_subtree_check)
        /export/External  192.168.2.*(rw,nohide,insecure,no_subtree_check)
      '';
    };
    networking.firewall.allowedTCPPorts = [ 2049 ];

    fileSystems."/media/External" = {
      device = "/dev/disk/by-uuid/5A0A43AE0A43864B";
      fsType = "ntfs";
      options = [
        "x-systemd.automount"
        "noauto"
      ];
    };
    fileSystems."/export/Storage" = {
      device = "/media/Storage";
      fsType = "btrfs";
      options = [ "bind" ];
    };
    fileSystems."/export/External" = {
      device = "/run/media/arc/External";
      fsType = "ntfs";
      options = [ "bind" ];
    };
  };
}
