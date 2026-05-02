{ self, inputs, ... }:
{
  flake.nixosModules.dev = {
    imports = [ inputs.home-manager.nixosModules.default ];
    home-manager.users.arc = {
      imports = [ self.homeModules.agents ];
    };
  };
  flake.homeModules.agents = {
    programs.opencode = {
      enable = true;
      enableMcpIntegration = true;
    };
  };
}
