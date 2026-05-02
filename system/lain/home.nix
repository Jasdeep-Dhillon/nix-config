{ self, inputs, ... }:
{
  flake.homeModules.lain = {
    imports = with self.homeModules; [
      base
      programs
    ];
  };
  flake.nixosModules.lain = {
    imports = [ inputs.home-manager.nixosModules.default ];
    home-manager = {
      # useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
    };
    home-manager.users.arc = self.homeModules.lain;
  };
}
