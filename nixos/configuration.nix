{ config, pkgs, ... }:

let
  # Allow fetching certain packages, notably discord, straight from master
  master = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/tarball/master)
    { config = config.nixpkgs.config; };
in
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Public modules
      # Comment out to disable stuff you don't want.
      ./modules.public/font-config.nix

      # Programming languages
      # These are usually quite small, but it's handy to have
      # them all separate. So they can be disabled and stuff.
      ./modules.public/development/general.nix

      ./modules.public/development/clojure.nix
      #./modules.public/development/csharp.nix
      ./modules.public/development/go.nix
      ./modules.public/development/haskell.nix
      ./modules.public/development/java.nix
      ./modules.public/development/kotlin.nix
      ./modules.public/development/nodejs.nix
      ./modules.public/development/python.nix
      ./modules.public/development/ruby.nix
      ./modules.public/development/rust.nix
      ./modules.public/development/scala.nix

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
      ${master.discord}/bin/Discord
    '')

    # Web
    qutebrowser element-desktop bitwarden
    signal-desktop keybase keybase-gui
    firefox chromium transmission-qt

    # Media
    mpv mpd mpc_cli imv krita gimp youtube-dl svtplay-dl

    # System tools
    exa du-dust bat mkpasswd gnupg curl wget
    tmux tldr neofetch htop bc nix-index
    alacritty killall jq fd ncpamixer slurp grim
    zathura unison

    # WM
    sway swaybg swayidle swaylock i3blocks xwayland wofi rofi mako
    xmonad-with-packages libnotify

    # Looks
    breeze-qt5
    breeze-gtk
    qt5.qtbase

    # Development - Editors
    vim neovim vimPlugins.vim-plug
    python38Packages.pynvim

    # Other
    libreoffice
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
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_12;
    port = 5432;
    ensureDatabases = [ ];
    ensureUsers = [ ];
  };

  # Enable Mariadb
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    port = 3306;
    ensureDatabases = [ ];
    ensureUsers = [ ];
  };

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
