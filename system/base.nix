{ self, ... }:
{
  flake.nixosModules.base = {
    imports = with self.nixosModules; [
      boot
      flatpak
      fonts
      lanzaboote
      locale
      networking
      run0
      services
      settings
      user
    ];
  };

  flake.homeModules.base = {
    home = {
      username = "arc";
      homeDirectory = "/home/arc";
      stateVersion = "26.05";
      shell.enableNushellIntegration = true;
    };
    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;
  };
}
