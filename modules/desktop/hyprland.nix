{ self, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      imports = with self.nixosModules; [
        sddm
        window-manager
        theme
      ];
      environment.systemPackages = with pkgs; [
        # Hypr Utilities
        hypridle
        hyprshot
        hyprpaper
        hyprcursor
        hyprlock
      ];

      services.hypridle.enable = true;

      programs = {
        hyprland = {
          enable = true;
          withUWSM = true;
        };
      };
    };
}
