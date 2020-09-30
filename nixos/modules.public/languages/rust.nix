{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup rustc cargo rustfmt

    # Vim plugins
    vimPlugins.coc-rls
    vimPlugins.rust-vim
  ];
}
