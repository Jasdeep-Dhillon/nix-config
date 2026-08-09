{ ... }: {
  flake.nixosModules.ipad = { pkgs, ... }: {
    services.usbmuxd.enable = true;
    environment.systemPackages = with pkgs; [ iloader ];
  };
}
