{ ... }:
{
  flake.nixosModules.hardware =
    { ... }:
    {
      imports = [ /etc/nixos/hardware-configuration.nix ];
    };
}
