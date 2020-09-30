{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ruby

    # Ruby packages
    rubyPackages.rake
    rubyPackages.rails

    # Vim plugins
    vimPlugins.vim-ruby
    vimPlugins.coc-solargraph
  ];
}
