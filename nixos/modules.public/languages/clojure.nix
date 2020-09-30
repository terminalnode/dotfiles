{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gradle leiningen clojure
    jetbrains.idea-community

    # Vim plugins
    vimPlugins.vim-parinfer
  ];
}
