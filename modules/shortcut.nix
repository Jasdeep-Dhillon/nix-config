{ ... }:
{
  flake.homeModules.shortcuts =
    { pkgs, lib, ... }:
    {
      xdg.desktopEntries = {
        "windows" = {
          name = "Windows";
          categories = [ "Utility" ];
          comment = "Boot to Windows";
          exec = ''
            pkexec ${(lib.getExe pkgs.nushell)} -c "bootctl set-oneshot auto-windows; reboot"
          '';
          icon = ../icons/windows.ico;
        };
        "warp-connect" = {
          name = "Warp Connect";
          categories = [ "Utility" ];
          comment = "Connect to Cloudflare Warp";
          exec = "nmcli connect up Warp";
          icon = ../icons/openvpn.png;
        };
        "warp-disconnect" = {
          name = "Warp Disconnect";
          categories = [ "Utility" ];
          comment = "Disconnect from Cloudflare Warp";
          exec = "nmcli connect down Warp";
          icon = ../icons/openvpn.png;
        };
      };
    };
}
