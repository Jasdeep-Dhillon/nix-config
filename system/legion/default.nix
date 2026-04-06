{ self, inputs, ... }:
{
  flake.nixosConfigurations.legion = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.settings
      self.nixosModules.lanzaboote

      self.nixosModules.legionHardware
      self.nixosModules.legionFileSystem
      self.nixosModules.legionPower
    ];

  };
}
