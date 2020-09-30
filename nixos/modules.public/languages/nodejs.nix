{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs

    # Node packages
    nodePackages.create-react-app

    # Vim plugins
    vimPlugins.vim-javascript
  ];
}
