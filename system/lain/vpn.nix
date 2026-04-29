{ ... }:
{
  flake.nixosModules.lain =
    { pkgs, ... }:
    {
      systemd.services.warp = {
        script = ''
          ${pkgs.networkmanager}/bin/nmcli connection up warp
        '';
        wantedBy = [ "multi-user.target" ];
      };
    };
}
