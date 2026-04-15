{ ... }:
{
  flake.nixosModules.plasma =
    { pkgs, ... }:
    {
      services.desktopManager.plasma6.enable = true;
      services.desktopManager.plasma6.enableQt5Integration = true;
      services.geoclue2.enable = false;
      services.orca.enable = false;
      environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-workspace-wallpapers
        konsole
        kwin-x11
        elisa
        gwenview
        okular
        kate
        ktexteditor
        khelpcenter
        baloo-widgets
        spectacle
        krdp
        discover
      ];
    };
}
