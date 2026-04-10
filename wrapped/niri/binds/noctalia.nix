{ ... }:
{
  flake.nixosModules.niriNoctalia =
    { pkgs, lib, ... }:
    {
      settings.binds = {
        "Mod+Space" = _: {
          props.cooldown-ms = 200;
          props.hotkey-overlay-title = "Launcher";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "launcher"
            "toggle"
          ];
        };
        "Mod+V" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Clipboard";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "launcher"
            "clipboard"
          ];
        };
        "Mod+Ctrl+Space" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Clipboard";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "launcher"
            "command"
          ];
        };
        "Mod+Period" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Emoji Picker";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "launcher"
            "emoji"
          ];
        };
        "Mod+K" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Audio Picker";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "volume"
            "togglePanel"
          ];
        };
        "Mod+I" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Settings";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
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
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "lockScreen"
            "lock"
          ];
        };
        "Mod+Escape" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Power Menu";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "sessionMenu"
            "toggle"
          ];
        };
        "Mod+A" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Control Center";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
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
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "notifications"
            "toggleHistory"
          ];
        };
        "Mod+Comma" = _: {
          props.repeat = false;
          props.hotkey-overlay-title = "Clear Notifications";
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "notifications"
            "clear"
          ];
        };

        XF86MonBrightnessUp = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "brightness"
            "increase"
          ];
        };
        XF86MonBrightnessDown = _: {
          props.allow-when-locked = true;
          content.spawn = [
            (lib.getExe pkgs.noctalia-shell)
            "ipc"
            "call"
            "brightness"
            "decrease"
          ];
        };
      };
    };
}
