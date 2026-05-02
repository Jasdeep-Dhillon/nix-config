{ self, inputs, ... }:
{
  flake.nixosModules.lain = {
    imports = [ inputs.home-manager.nixosModules.default ];
    home-manager = {
      useUserPackages = true;
      backupFileExtension = "bak";
    };
    home-manager.users.arc = {
      imports = [ self.homeModules.base ];
    };
  };
}
