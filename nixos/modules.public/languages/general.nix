{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    heroku jq git gnumake
    vscodium postman
  ];
}
