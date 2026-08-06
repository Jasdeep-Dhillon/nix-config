{ ... }:
{
  flake.nixosModules.jellyfin-server =
    { pkgs, ... }:
    let
      frei0r-overlay = final: prev: {
        frei0r = prev.frei0r.overrideAttrs (old: {
          nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.cudaPackages.cuda_nvcc ];
        });
      };
    in
    {
      nixpkgs.overlays = [ frei0r-overlay ];
      services.jellyfin = {
        enable = true;
        user = "arc";
      };
      environment.systemPackages = with pkgs; [
        jellyfin
        jellyfin-web
        jellyfin-ffmpeg
      ];
    };

  flake.nixosModules.jellyfin-client =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.jellyfin-desktop ];
    };
}
