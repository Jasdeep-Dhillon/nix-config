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

      home-manager.users.arc = self.homeModules.imports;
    };

  flake.homeConfigurations.arc = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.imports
    ];
  };

  flake.homeModules.imports = {
      imports = with self.homeModules; [
        base
        theme
        services
        packages
        programs

        shortcuts

        # Dev
        # android
        editor
        devApps
        vcs
        toolchain
        zed
        lsp
      ];
    };
}
