{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk8 jdk11
    gradle ant
    jetbrains.idea-community
    android-studio

    # Vim packages
    vimPlugins.coc-java
  ];

}
