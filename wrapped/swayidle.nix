{ self, inputs, ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      packages.swayidle = inputs.wrapper-modules.wrappers.swayidle.wrap {
        inherit pkgs;
        events = {
          after-resume = "niri msg action power-on-monitors";
          before-sleep = "pidof hyprlock || ${
            lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock
          }";
          idlehint = 900;
          lock = "${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock}";
          # unlock = "";
        };
        # extraArgs = [ "-d" ];
        timeouts = [
          {
            timeout = 850;
            command = "pidof hyprlock || ${
              lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock
            }";
          }
          {
            timeout = 900;
            command = "niri msg action power-off-monitors";
          }
        ];
      };
    };
}
