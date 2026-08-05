{ ... }: {
  flake.nixosModules.legion = {
    networking.hostName = "legion";
  };
}
