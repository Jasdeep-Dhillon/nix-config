{ ... }:
{
  flake.nixosModules.lain =
    { pkgs, ... }:
    {
      systemd.services.warp = {
        script = ''
          ${pkgs.networkmanager}/bin/nmcli connection up warp
        '';
        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        requires = [ "network-online.target" ];
        wantedBy = [ "network-online.target" ];
      };
    };
}
