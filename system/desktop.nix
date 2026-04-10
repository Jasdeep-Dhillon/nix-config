{ self, ... }:
{
  flake.nixosModules.desktop = {
    imports = with self.nixosModules; [
      niri
      sddm
      window-manager
      theme
    ];
  };
}
