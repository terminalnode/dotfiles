{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_3
    dotnet-aspnetcore
  ];
}
