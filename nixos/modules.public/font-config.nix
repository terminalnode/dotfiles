{ config, pkgs, ... }

{
  fonts.enableDefaultFonts = true;
  fonts.enableFontDir = true;

  fonts.fonts = [
    pkgs.source-code-pro
    pkgs.nerdfonts
    pkgs.font-awesome
    pkgs.twemoji-color-font
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
