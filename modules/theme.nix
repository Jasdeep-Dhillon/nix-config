{ inputs, ... }:
{
  flake.nixosModules.theme =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.nixosModules.stylix ];
      environment.systemPackages = with pkgs; [
        kdePackages.breeze
        kdePackages.breeze.qt5
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
      home.file."Pictures/Wallpapers".source = ../wallpapers;

      xdg.configFile.dolphinrc.source = (pkgs.formats.ini { }).generate "dolphinrc" {
        ContextMenu = {
          ShowOpenInNewWindow = false;
          ShowOpenTerminal = false;
          ShowSortBy = false;
          ShowViewMode = false;
        };
        General = {
          BrowseThroughArchives = true;
          DynamicView = true;
          GlobalViewProps = false;
          OpenNewTabAfterLastTab = true;
          ShowFullPath = true;
          ShowToolTips = true;
          ShowZoomSlider = true;
          UseTabForSwitchingSplitView = true;
          Version = 202;
          ViewPropsTimestamp = "2025,12,30,23,6,30.167";
        };
        MainWindow = {
          MenuBar = "Disabled";
        };
        UiSettings = {
          ColorScheme = "*";
        };
        PreviewSettings = {
          Plugins = "appimagethumbnail,audiothumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,opendocumentthumbnail,svgthumbnail,textthumbnail";
        };
      };
      
      home.packages = with pkgs; [
        kdePackages.qt6ct
        libsForQt5.qt5ct
      ];
      stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        polarity = "dark";
        targets.qt = {
          enable = false;
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

      qt = {
        enable = true;
        platformTheme = {
          name = "qtct";
          package = pkgs.catppuccin-qt5ct;
        };
        qt5ctSettings = {
          Appearance = {
            style = "Breeze";
            icon_theme = "breeze-dark";
            standard_dialogs = "xdgdesktopportal";
            color_scheme_path = "~/.nix-profile/share/qt5ct/colors/catppuccin-mocha-lavender.conf";
            custom_palette = true;
          };
          Fonts = {
            fixed = ''"Maple Mono NF,12"'';
            general = ''"Inter,12"'';
          };
        };
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
