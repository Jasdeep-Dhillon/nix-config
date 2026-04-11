{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        package = inputs.niri-flake.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
        extraPackages = with pkgs; [
          nirius
          xwayland-satellite
          jq
          kdePackages.kirigami.unwrapped
        ];
        v2-settings = true;
        imports = with self.nixosModules; [
          niriInput
          niriLayout
          niriOutputs
          niriRules
          niriWorkspace

          niriBinds
          niriApplications
          niriMedia
          niriNoctalia
          niriWindows
          niriStart
        ];
        settings = {
          prefer-no-csd = { };
          environment = {
            QT_QPA_PLATFORMTHEME = "qt6ct";
            NIXOS_OZONE_WL = "1";
            GTK_USE_PORTAL = "1";
          };
          cursor = {
            hide-when-typing = { };
          };
          overview = {
            zoom = 0.6;
            backdrop-color = "#181825";
          };
          clipboard = {
            disable-primary = { };
          };
          hotkey-overlay = {
            skip-at-startup = { };
          };
          screenshot-path = ''
            ~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png
          '';
          animations = {
            slowdown = 0.5;
          };
        };
      };
    };
}
