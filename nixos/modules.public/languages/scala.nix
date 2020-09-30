{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gradle sbt scala
    jetbrains.idea-community
  ];
}
