{ ... }:
{
  flake.nixosModules.user =
    { pkgs, ... }:
    {
      users.users.arc = {
        name = "arc";
        isNormalUser = true;
        description = "Arc";
        extraGroups = [
          "networkmanager"
          "wheel"
          "video"
          "input"
          "gamemode"
          "kvm"
        ];
        shell = pkgs.nushell;
      };
    };
}
