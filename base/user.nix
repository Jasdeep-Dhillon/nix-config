{ pkgs, ... }:
{
  flake.nixosModules.user = {
    users.users.arc = {
      isNormalUser = true;
      description = "Arc's user account";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "input"
        "gamemode"
        "kvm"
      ];
    };
    shell = pkgs.nushell;
  };
}
