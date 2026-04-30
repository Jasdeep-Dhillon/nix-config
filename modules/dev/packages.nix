{ ... }:
{
  flake.nixosModules.dev =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        fd
        zellij
        hyperfine
        tokei
      ];
    };

  flake.homeModules.devApps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # GUI Dev Applications
        github-desktop
        hoppscotch
        gitui

        # CLI Packages
        openssl
        ripgrep
        jujutsu
        jjui
        fzf
        fx
        just
        devenv
      ];
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableNushellIntegration = true;
      };
    };
}
