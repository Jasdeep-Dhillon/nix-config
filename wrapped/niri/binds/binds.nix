{ ... }:
{
  flake.nixosModules.niriBinds = {
    settings.binds = {
      "Mod+Shift+Slash" = {
        show-hotkey-overlay = { };
      };
      "Mod+O" = _: {
        props = {
          repeat = false;
          hotkey-overlay-title = "Pick Screenshare window";
        };
        content = {
          spawn-sh = "niri msg action set-dynamic-cast-window --id $(niri msg --json pick-window | jq .id)";
        };
      };
      "Mod+Shift+O" = _: {
        props = {
          repeat = false;
          hotkey-overlay-title = "Screenshare Current Monitor";
        };
        content = {
          set-dynamic-cast-monitor = { };
        };
      };
      "Mod+P" = _: {
        props = {
          repeat = false;
          hotkey-overlay-title = "Toggle Laptop Display";
        };
        content = {
          spawn-sh = ''
            niri msg --json outputs |
              jq -e '.["eDP-1"].current_mode != 1' &&
              niri msg output 'BOE 0x0A9B Unknown' on ||
              niri msg output 'BOE 0x0A9B Unknown' off
          '';
        };
      };
      "Mod+grave" = _: {
        props = {
          repeat = false;
          hotkey-overlay-title = "Toggle Overview";
        };
        content = {
          toggle-overview = { };
        };
      };
      "Mod+Q" = {
        close-window = { };
      };
      "Mod+Shift+Q" = {
        spawn = [
          "pkill"
          "-9"
          "gamescope"
        ];
      };
    };
  };
}
