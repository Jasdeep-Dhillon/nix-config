{ ... }:
{
  flake.nixosModules.lain = {
    networking.networkmanager.enable = true;
    networking.hostName = "lain";
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
      ];
    };
    security.acme = {
      acceptTerms = true;
      defaults.email = "jasdeepsdhillon@proton.me";
    };
    services.nginx = {
      enable = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts."lain" = {
        serverAliases = [ "localhost" ];
        default = true;
        locations."/" = {
          proxyPass = "http://localhost:8096";
          proxyWebsockets = true;
        };
        locations."/qbit/" = {
          proxyPass = "http://localhost:8080/"; # note trailing slash
          proxyWebsockets = true;
          extraConfig = ''
            sub_filter_once off;
            sub_filter_types application/javascript text/css text/html application/json;
            sub_filter '"/' '/qbit/';
            sub_filter '="' '="/qbit';
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };
    };
  };
}
