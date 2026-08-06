{ self, inputs, ... }:
{
  flake.nixosModules.base = {
    imports = [ self.nixosModules.run0 ];
  };
  flake.nixosModules.run0 =
    { ... }:
    {
      imports = [ inputs.run0-sudo-shim.nixosModules.default ];
      security.run0-sudo-shim.enable = true;
      security.sudo.enable = false;
    };
}
