{ ... }:
{
  flake.nixosModules.lain = {
    systemd.services.warp = {
      script = ''
        nmcli connection up warp
      '';
      wantedBy = [ "multi-user.target" ];
    };
  };
}
