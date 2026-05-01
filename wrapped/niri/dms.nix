{ self, ... }:
{
  flake.nixosModules.niriShell =
    { pkgs, lib, ... }:
    {
      settings = {
        spawn-at-startup = [
          [
            (lib.getExe pkgs.runapp)
            (lib.getExe pkgs.dms-shell)
            "run"
          ]
        ];
      };
      settings.switch-events = {
        lid-close = {
          spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "toast"
            "info"
            "Laptop Closed"
          ];
        };
        lid-open = {
          spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "toast"
            "info"
            "Laptop Opened"
          ];
        };
      };
      settings.binds = {
        "Mod+F5" = {
          spawn = [ (lib.getExe pkgs.dms-shell) ];
        };
        "Mod+Space" = _: {
          props.cooldown-ms = 200;
          props.hotkey-overlay-title = "Launcher";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "spotlight"
            "toggle"
          ];
        };
        "Mod+V" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Clipboard";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "clipboard"
            "toggle"
          ];
        };
        "Mod+Ctrl+Space" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Clipboard";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "spotlight"
            "openQuery"
            "> "
          ];
        };
        "Mod+Period" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Emoji Picker";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "spotlight"
            "openQuery"
            ":"
          ];
        };
        "Mod+K" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Output Switch";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "dash"
            "toggle"
            "media"
          ];
        };
        "Mod+I" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Settings";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "settings"
            "toggle"
          ];
        };
        "Mod+L" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Lock Screen";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "lock"
            "lock"
          ];
        };
        "Mod+Escape" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Power Menu";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "powermenu"
            "toggle"
          ];
        };
        "Mod+A" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Control Center";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "controlCenter"
            "toggle"
          ];
        };
        "Mod+N" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Notifications";
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "notifications"
            "toggle"
          ];
        };

        XF86MonBrightnessUp = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "brightness"
            "increment"
            "2"
          ];
        };
        "Mod+XF86AudioRaiseVolume" = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "brightness"
            "increment"
            "2"
            "''"
          ];
        };
        "Mod+XF86AudioLowerVolume" = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "brightness"
            "decrement"
            "''"
          ];
        };
        XF86MonBrightnessDown = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "brightness"
            "decrement"
            "2"
            "''"
          ];
        };
        XF86AudioPlay = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "mpris"
            "playPause"
          ];
        };
        XF86AudioStop = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "mpris"
            "stop"
          ];
        };
        XF86AudioPrev = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "mpris"
            "previous"
          ];
        };
        XF86AudioNext = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.dms-shell)
            "ipc"
            "call"
            "mpris"
            "next"
          ];
        };
      };
      settings.layout = {
        background-color = "transparent";
      };
      settings.layer-rules = [
        {
          matches = [
            { namespace = "^quickshell$"; }
          ];
          place-within-backdrop = true;
        }
        {
          matches = [
            { namespace = ''r#"^dms:.*"#''; }
            # { namespace = "^dms:(color-picker|clipboard|spotlight|settings)$"; }
            # { namespace = "^noctalia-osd.*$"; }
            # { namespace = "^noctalia-toast.*$"; }
            # { namespace = "^noctalia-notifications.*$"; }
          ];
        }
      ];
    };
}
