{ ... }:
{
  flake.nixosModules.legionPower = {
    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
    services.power-profiles-daemon.enable = false;

    services.tlp = {
      enable = true;
      pd.enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 1;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 1;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 1;
        RESTORE_DEVICE_STATE_ON_STARTUP = 1;
        DEVICES_TO_ENABLE_ON_STARTUP = "bluetooth wifi wwan";
        DEVICES_TO_DISABLE_ON_SHUTDOWN = "bluetooth wifi wwan";
        DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth wifi wwan";
      };
    };
  };
}
