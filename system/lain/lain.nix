{ self, inputs, ... }:
{
  flake.nixosConfigurations.lain = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      lain
      
      boot
      lanzaboote
      locale
      run0
      services
      settings
      user
      ssh-server
      jellyfin-server
      nvidia
      vcs
      programs
    ];
  };
}
