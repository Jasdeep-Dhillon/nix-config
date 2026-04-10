{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.homeManager =
    { ... }:
    {
      imports = [ inputs.home-manager.nixosModules.default ];
      home-manager = {
        # useGlobalPkgs = true;
        useUserPackages = true;
      };
      home-manager.users.arc = self.homeModules.base;
    };

  flake.homeConfigurations.arc = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = with self.homeModules; [
      base

      theme
      services
      packages
      programs

      shortcuts

      # Dev
      android
      editor
      devApps
      toolchain
      zed
    ];
  };
}
