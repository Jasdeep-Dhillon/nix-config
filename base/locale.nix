{ self, ... }:
{
  flake.nixosModules.base = {
    imports = [ self.nixosModules.locale ];
  };
  flake.nixosModules.locale = {
    time.timeZone = "America/Toronto";
    time.hardwareClockInLocalTime = true;

    i18n.defaultLocale = "en_CA.UTF-8";
  };
}
