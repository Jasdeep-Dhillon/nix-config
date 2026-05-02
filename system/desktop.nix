{ self, inputs, ... }:
{
  flake.nixosModules.desktop = {
    imports = with self.nixosModules; [
      niri
      inputs.home-manager.nixosModules.default
    ];
    home-manager.users.arc = {
      imports = [ self.homeModules.desktop ];
    };
  };

  flake.homeModules.desktop = {
    imports = with self.homeModules; [
      services
      shortcuts
      theme
    ];
  };
}
