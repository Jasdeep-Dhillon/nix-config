{ self, inputs, ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      packages.swayidle = inputs.wrapper-modules.wrappers.swayidle.wrap {
        inherit pkgs;
        events = {
          after-resume = "niri msg action power-on-monitors";
          # before-sleep = "";
          idlehint = 300;
          lock = "${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock}";
          # unlock = "";
        };
        extraArgs = [ "-w" ];
        timeouts = [
          {
            timeout = 900;
            command = "${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock}";
          }
          {
            timeout = 900;
            command = "niri msg action power-off-monitors";
          }
          {
            timeout = 900;
            command = "systemctl suspend-then-hibernate";
          }
          {
            timeout = 850;
            command = ''${pkgs.libnotify}/bin/notify-send "Going to sleep soon"'';
          }
        ];
      };
    };
}
