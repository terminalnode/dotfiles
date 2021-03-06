{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking = {
    hostName = "yourhostname";
    useDHCP = false; # Future default value, better get used to it.
    wlanInterfaces.wifi.device = "wlp3s0"; # Rename wlp3s0 to wifi
    # networkmanager.enable = true;

    interfaces = {
      wlp3s0.useDHCP = true;
      wifi.useDHCP = true;
    };

    hosts = {
      "192.168.1.1" = [ "name1" "name2" "name3" ];
      "192.168.1.2" = [ "justonename" ];
    };

    wireless = {
      enable = true;
      networks = {
        SomeEssidHere = { pskRaw = "long key, output of <ssid> <passphrase>"; };
        "Essid With Spaces" = { pskRaw = "nahunsahuhaosneuhrsdö29410henohurgrg0"; };
      };
    };
  };
}
