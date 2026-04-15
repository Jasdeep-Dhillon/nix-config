{ self, ... }:
{
  flake.nixosModules.niri =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModules.settings
      ];
      services.gnome.gnome-keyring.enable = false;
      security.pam.services = {
        login.kwallet.enable = lib.mkForce false;
        kde.kwallet.enable = lib.mkForce false;
      };
      services.displayManager.defaultSession = "niri";
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
      };
      xdg.portal = {
        xdgOpenUsePortal = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gnome
          kdePackages.xdg-desktop-portal-kde
        ];
        configPackages = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
        config.common = {
          default = [ "gnome" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
        };
      };

      # Niri Nvidia rule
      environment.etc."nvidia/nvidia-application-profiles-rc.d/50-niri.json".text = ''
        {
          "rules": [
            {
              "pattern": {
                "feature": "procname",
                "matches": "niri"
              },
              "profile": "niri"
            }
          ],
          "profiles": [
            {
              "name": "niri",
              "settings": [
                {
                  "key": "GLVidHeapReuseRatio",
                  "value": 0
                }
              ]
            }
          ]
        }
      '';
    };
}
