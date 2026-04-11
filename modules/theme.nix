{ inputs, ... }:
{
  flake.nixosModules.theme =
    { pkgs, lib, ... }:
    {
      imports = [ inputs.stylix.nixosModules.stylix ];
      services.desktopManager.plasma6.enableQt5Integration = true;
    };
  flake.homeModules.theme =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        polarity = "dark";

        image = ../wallpapers/96740776_p5.jpg;
        icons.enable = false;
        # cursor = {
        #   enable = false;
        #   name = "Quintom_Ink";
        #   package = pkgs.quintom-cursor-theme;
        #   size = 20;
        # };
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
      home.packages = with pkgs; [
        catppuccin-qt5ct
        rewaita
        kdePackages.breeze
        kdePackages.breeze-icons
        adwaita-icon-theme
        adwaita-icon-theme-legacy
      ];
      gtk = {
        gtk4.theme = config.gtk.theme;
        enable = true;
        colorScheme = lib.mkForce "dark";
        iconTheme = {
          package = pkgs.morewaita-icon-theme;
          name = "MoreWaita";
        };
        font = {
          name = "Inter";
          size = 12;
        };
      };
      dconf = {
        settings = {
          "org/gnome/desktop/wm/preferences" = {
            button-layout = "icon: close";
          };
        };
      };
      qt = {
        enable = true;
        platformTheme.name = lib.mkForce "qt6ct";
        qt6ctSettings = {
          Appearance = {
            style = "Breeze";
            icon_theme = "breeze-dark";
            standard_dialogs = "xdgdesktopportal";
            color_scheme_path = "~/.nix-profile/share/qt6ct/colors/catppuccin-mocha-lavender.conf";
            custom_palette = true;
          };
          Fonts = {
            fixed = ''"Maple Mono NF,12"'';
            general = ''"Inter,12"'';
          };
        };
      };
    };
}
