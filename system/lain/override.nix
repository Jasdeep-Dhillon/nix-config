{ ... }:
{
  flake.nixosModules.lain =
    {
      config,
      pkgs,
      lib,
      ...
    }:

    {
      environment.systemPackages = [
        pkgs.helix
        pkgs.just
      ];
      hardware = {
        graphics.extraPackages = with pkgs; [ intel-media-driver ];
        nvidia = {
          open = lib.mkForce false;
          package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
          powerManagement.enable = lib.mkForce false;
          nvidiaPersistenced = true;
          prime = {
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
            offload = {
              enable = true;
              enableOffloadCmd = true;
            };
          };
        };
        enableAllFirmware = true;
      };
      services.qbittorrent = {
        enable = true;
        openFirewall = true;
        user = "arc";
        serverConfig = {
          LegalNotice.Accepted = true;
          BitTorrent = {
            Session = {
              DefaultSavePath = "/media/Storage/Downloads";
              TempPath = "/var/lib/qBittorrent/qBittorrent/downloads/temp";
              TempPathEnabled = true;
              TorrentExportDirectory = "/media/Storage/Downloads/torrent-files";
              AnonymousModeEnabled = true;
            };
          };
          Preferences = {
            WebUI = {
              Username = "arc";
              Password_PBKDF2 = "@ByteArray(fofM+dpr882+CmuHDEnEhQ==:AoEXHAVs9DKZgL2m8G3yycw1Em
                   │ C4WSrFhzKst4k+NzueKo4FZ4jH552vmVtYgoH+d1iDqsipEgqtXtkAC0lTSQ==)";
              ReverseProxySupportEnabled = true;
            };
          };
        };
      };
      services.logind.settings.Login.HandleLidSwitch = "ignore";
      powerManagement.enable = true;
    };
}
