{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gradle jdk8 jdk11 kotlin
    jetbrains.idea-community
    android-studio

    # Vim plugins
    vimPlugins.kotlin-vim
  ];
}
