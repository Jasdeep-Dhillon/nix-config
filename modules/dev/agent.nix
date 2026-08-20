{ self, inputs, ... }:
{
  flake.nixosModules.dev = {
    home-manager.users.arc = {
      imports = [ self.homeModules.agents ];
    };
  };
  flake.homeModules.agents = { pkgs, ... }: {
    programs.opencode = {
      enable = true;
      enableMcpIntegration = true;
    };
    home.packages = [ inputs.autolith.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };
}
