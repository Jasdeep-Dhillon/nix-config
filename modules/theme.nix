{ inputs, ... }:
{
  flake.nixosModules.theme =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.nixosModules.stylix ];
      services.desktopManager.plasma6.enableQt5Integration = true;
      environment.systemPackages = with pkgs; [
        kdePackages.breeze
        kdePackages.breeze-icons
        adwaita-icon-theme
        adwaita-icon-theme-legacy
        morewaita-icon-theme
      ];
    };
  flake.homeModules.theme =
    { pkgs, lib, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        polarity = "dark";
        targets.qt = {
          enable = true;
          platform = "qtct";
          standardDialogs = "xdgdesktopportal";
        };
        icons = {
          enable = true;
          dark = "Adwaita";
          light = "Adwaita";
          package = pkgs.adwaita-icon-theme;
        };
        fonts = {
          sizes = {
            applications = 12;
            desktop = 12;
            terminal = 12;
          };
          serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
          };
          sansSerif = {
            package = pkgs.inter;
            name = "Inter";
          };
          monospace = {
            package = pkgs.maple-mono.NF;
            name = "Maple Mono NL NF";
          };
          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
        };
      };
      home.pointerCursor = lib.mkDefault {
        enable = true;
        name = "Quintom_Ink";
        package = pkgs.quintom-cursor-theme;
        size = 20;
        hyprcursor = {
          enable = true;
          size = 20;
        };
        gtk.enable = true;
      };
      dconf = {
        settings = {
          "org/gnome/desktop/wm/preferences" = {
            button-layout = "icon: close";
          };
        };
      };
    };
}
