{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Public modules
      # Comment out to disable stuff you don't want.
      ./modules.public/font-config.nix

      # Private modules
      # Copy the respective templates from ./modules.templates
      # to ./modules.local and fill in your preferences.
      ./modules.local/user-config.nix
      ./modules.local/network-config.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages =  [ config.boot.kernelPackages.broadcom_sta ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  console.keyMap = "dvorak-sv-a5";
  time.timeZone = "Europe/Stockholm";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Discord with lower case link
    (writeShellScriptBin "discord" ''
      ${pkgs.discord}/bin/Discord
    '')

    # Web
    qutebrowser element-desktop bitwarden
    signal-desktop keybase keybase-gui
    firefox chromium

    # Media
    mpv mpd mpc_cli imv krita gimp youtube-dl svtplay-dl

    # System tools
    exa du-dust bat mkpasswd gnupg curl wget
    tmux tldr neofetch htop bc nix-index
    alacritty killall

    # WM
    sway swaybg swayidle swaylock i3blocks xwayland wofi rofi mako
    xmonad-with-packages libnotify

    # Development - Languages
    python ruby jdk8 jdk11 ghc scala clojure

    # Development - Tools
    git gradle sbt leiningen heroku stack jq ant
    nodejs gnumake

    # Development - Editors
    vim neovim vimPlugins.vim-plug
    jetbrains.idea-community android-studio
    python38Packages.pynvim
  ];

  # Various
  services.keybase.enable = true;
  services.unifi.enable = true;
  services.openssh.enable = true;
  security.pam.services.swaylock = { };

  # ZSH configuration
  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.histSize = 10000;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.autorun = false;
  services.xserver.layout = "se";
  services.xserver.xkbVariant = "dvorak_a5";
  services.xserver.xkbOptions = "caps:swapescape,compose:ctrl,grp:alt_caps_toggle";

  # Enable Postgres
  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql_12;
  services.postgresql.port = 5432;
  services.postgresql.ensureDatabases = [
    "mrfreeze_settings"
  ];
  #services.postgresql.ensureUsers = [
  #  {
  #    name = "terminal";
  #    ensurePermissions = { "DATABASE mrfreeze_settings" = "ALL_PRIVILEGES"; };
  #  }
  #];

  # Enable Mariadb
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
  services.mysql.port = 3306;
  services.mysql.ensureDatabases = [];
  services.mysql.ensureUsers = [];

  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  services.xserver.libinput.naturalScrolling = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}
