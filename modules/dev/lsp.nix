{...}:
{
  flake.homeModules.lsp = {pkgs, ...}:{
    home.packages = with pkgs;[
      nil nixd
      hyprls
      kdePackages.qtdeclarative
      jsonfmt
    ];
  };
}
