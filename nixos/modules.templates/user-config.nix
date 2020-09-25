{ config, pkgs, ... }:

{
  users.users =
    { terminal =
        {
          isNormalUser = true;
          home = "";
          extraGroups = [ "wheel" ];
          hashedPassword = "";
          shell = pkgs.zsh;
        };
    };
  users.mutableUsers = false;
  hardware.acpilight.enable = true; # Allow users in video group to control backlight
}
