{ ... }:
{
  flake.nixosModules.lain = {
    services.samba = {
      enable = true;
      openFirewall = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
        };
        "storage" = {
          "path" = "/media/Storage";
          "valid users" = "arc";
          "force user" = "arc";
          "public" = "no";
          "writeable" = "yes";
        };
        "external" = {
          "path" = "/media/External";
          "valid users" = "arc";
          "force user" = "arc";
          "public" = "no";
          "writeable" = "yes";
        };
      };
    };
    services.samba-wsdd = {
      enable = true;
      openFirewall = true;
      discovery = true;
    };
    services.avahi = {
      enable = true;
      publish.enable = true;
      publish.userServices = true;
      nssmdns4 = true;
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
