{ inputs, ... }:
{
  flake.nixosModules.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ffmpeg
        yt-dlp
        wget
        imagemagick
        uutils-coreutils-noprefix
        bottom
        eza
        zoxide
        dua
        bazaar
        yazi
        s-tui
      ];
    };

  flake.homeModules.packages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        imv
        starship-jj
        gnome-calculator
        snapshot
        zathura
        papers
        resources
        video-trimmer
        bitwarden-desktop
        vesktop
        scrcpy
        qbittorrent
        telegram-desktop
        (discord.override {
          withVencord = true;
          withOpenASAR = true;
        })
        loupe
        unrar
        prismlauncher
        onlyoffice-desktopeditors
        pear-desktop
        easyeffects
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
      programs.obs-studio = {
        enable = true;
        # optional Nvidia hardware acceleration
        package = (
          pkgs.obs-studio.override {
            cudaSupport = true;
          }
        );
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
          obs-vaapi # optional AMD hardware acceleration
          obs-gstreamer
          obs-vkcapture
        ];
      };
    };
}
