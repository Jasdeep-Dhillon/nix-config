{ ... }:
{
  flake.homeModules.agents = {
    programs.opencode = {
      enable = true;
      enableMcpIntegration = true;
    };
  };
}
