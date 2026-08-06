{ self, ... }:
{
  flake.nixosModules.base = {
    imports = [ self.nixosModules.tpm ];
  };
  flake.nixosModules.tpm = {
    security.tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
    users.users.arc.extraGroups = [ "tss" ];
  };
}
