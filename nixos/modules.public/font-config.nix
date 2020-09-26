{ config, pkgs, ... }:

{
  fonts.enableDefaultFonts = true;
  fonts.enableFontDir = true;

  fonts.fonts = with pkgs; [
    source-code-pro
    nerdfonts
    font-awesome
    twemoji-color-font
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [
        "Twemoji Color Font"
        "Noto Color Emoji"
      ];
      monospace = [
        "SauceCodePro Nerd Font Mono"
        "Source Code Pro"
        "DejaVu Sans Mono"
      ];
    };
  };
}
