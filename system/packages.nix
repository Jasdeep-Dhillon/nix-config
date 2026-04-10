{ ... }:
{
  flake.nixosModules.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ffmpeg
        yt-dlp
        bat
        wget
        imagemagick
        uutils-coreutils-noprefix
        bottom
        fastfetch
        eza
        zoxide
        dua
        bazaar
        yazi
        s-tui
      ];
    };
}
