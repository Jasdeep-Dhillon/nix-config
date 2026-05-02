{ self, inputs, ... }:
{
  flake.nixosModules.niriShell =
    { pkgs, lib, ... }:
    let
      vibepanel = (pkgs.formats.toml { }).generate "vibepanel.toml" {
        bar = {
          position = "top";
          size = 30;
          spacing = 2;
          inset = 8;
          screen_margin = 4;
          border_radius = 60;
          popover_offset = 4;
          background_opacity = 0.75;
          background_color = "#1e1e2e";
        };
        widgets = {
          left = [
            "custom-fuzzel"
            "media"
            "clock"
          ];
          center = [ "taskbar" ];
          right = [
            "tray"
            "custom-clipboard"
            "notifications"
            "cpu"
            "battery"
            "quick_settings"
          ];
          border_radius = 60;
          background_opacity = 0.7;
          background_color = "#1e1e2e";
          popover_background_opacity = 0.9;
          clock = {
            format = "%I:%M %p • %A, %b %-d";
          };
          media = {
            visualizer = true;
          };
          custom-fuzzel = {
            icon = "apps";
            # label = "Launcher";
            tooltip = "Fuzzel";
            on_click = "pkill -x fuzzel || ${
              lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.fuzzel
            }";
          };
          custom-clipboard = {
            icon = "content_paste";
            tooltip = "Clipboard";
            on_click = "kitty --class clipse -e ${lib.getExe pkgs.clipse}";
          };
        };
        theme = {
          mode = "auto";
          scheme = "dark";
          accent = "#b4befe";
          animations = true;
          ripple = false;
          blur = true;
          outline = false;
          icons = {
            theme = "material";
            weight = 400;
          };
          states = {
            success = "#a6e3a1";
            warning = "#f9e2af";
            urgent = "#f38ba8";
          };
          typography.font_family = "Inter";
        };
        osd = {
          enabled = true;
          position = "bottom";
          show_value = true;
        };
        advanced.compositor = "niri";
      };
    in
    {
      extraPackages = [
        inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default
        self.packages.${pkgs.stdenv.hostPlatform.system}.fuzzel
      ];
      settings.spawn-at-startup = [
        [
          (lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.swayidle)
        ]
        [
          (lib.getExe pkgs.swaybg)
          "-i"
          "${self.wallpaper}"
          "-m"
          "fill"
        ]
        [
          (lib.getExe pkgs.runapp)
          (lib.getExe pkgs.clipse)
          "-listen"
        ]
        [
          # (lib.getExe pkgs.runapp)
          (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
          "--config"
          "${vibepanel}"
        ]
      ];

      settings.switch-events = {
        lid-close = {
          spawn = [
            "${pkgs.libnotify}/bin/notify-send"
            "Laptop Closed"
          ];
        };
        lid-open = {
          spawn = [
            "${pkgs.libnotify}/bin/notify-send"
            "Laptop Opened"
          ];
        };
      };
      settings.binds = {
        "Mod+F5" = {
          spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
          ];
        };
        "Mod+Space" = _: {
          props.cooldown-ms = 200;
          props.hotkey-overlay-title = "Launcher";
          content.spawn-sh = "pkill -x fuzzel || ${
            lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.fuzzel
          }";
          # [
          #   (lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.fuzzel)
          # ];
        };
        "Mod+V" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Clipboard";
          content.spawn = [
            (lib.getExe pkgs.kitty)
            "--class"
            "clipse"
            "-e"
            (lib.getExe pkgs.clipse)
          ];
        };
        "Mod+Ctrl+Space" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Command Runner";
          content.spawn-sh = ''
            sh -c "$(fuzzel -d -p $: )"
          '';
        };
        "Mod+Period" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Emoji Picker";
          content.spawn = [
            (lib.getExe pkgs.bemoji)
          ];
        };
        "Mod+F1" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Lock Screen";
          content.spawn = [
            (lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock)
          ];
        };
        # "Mod+Escape" = _: {
        #   props.repeat = false;
        #   props.hotkey-overlay-title = "Power Menu";
        #   content.spawn = [
        #     (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
        #     "ipc"
        #     "call"
        #     "powermenu"
        #     "toggle"
        #   ];
        # };
        "Mod+A" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Quick Settings";
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "popover"
            "toggle"
            "quick_settings"
          ];
        };
        "Mod+N" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Notifications";
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "popover"
            "toggle"
            "notifications"
          ];
        };

        XF86MonBrightnessUp = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "brightness"
            "inc"
            "2"
          ];
        };
        "Mod+XF86AudioRaiseVolume" = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "brightness"
            "inc"
            "2"
          ];
        };
        "Mod+XF86AudioLowerVolume" = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "brightness"
            "dec"
            "2"
          ];
        };
        XF86MonBrightnessDown = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "brightness"
            "dec"
            "2"
          ];
        };
        XF86AudioPlay = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "media"
            "play-pause"
          ];
        };
        XF86AudioStop = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "media"
            "stop"
          ];
        };
        XF86AudioPrev = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "media"
            "previous"
          ];
        };
        XF86AudioNext = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe inputs.vibepanel.packages.${pkgs.stdenv.hostPlatform.system}.default)
            "media"
            "next"
          ];
        };
      };
      settings.window-rules = [
        {
          matches = [ { app-id = "clipse"; } ];
          default-floating-position = _: {
            props = {
              x = 0;
              y = 70;
              relative-to = "top";
            };
          };
          default-window-height = [
            { proportion = 0.7; }
          ];
          default-column-width = [
            { proportion = 0.3; }
          ];
          open-floating = true;
        }
      ];
      settings.layer-rules = [
        {
          matches = [
            # { layer = "overlay"; }
            { namespace = "launcher"; }
          ];
          background-effect = {
            blur = true;
            xray = true;
          };
        }
      ];
    };
}
