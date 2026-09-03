{ inputs, ... }: {
  flake.homeModules.browser = { pkgs, ... }: {
    home.packages = [
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.helium-widevine-beta
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
