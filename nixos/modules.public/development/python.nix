{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python
    pipenv

    # Vim plugins
    vimPlugins.coc-python
    vimPlugins.jedi-vim
  ];
}
