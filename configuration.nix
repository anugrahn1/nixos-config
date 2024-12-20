# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  # https://demonastery.org/2022/05/custom-packages-with-nixos/
  nixpkgs.overlays = [
    (self: super: {
      presenterm-export = super.callPackage ./modules/presenterm-export { }; # path containing default.nix
    })
  ];
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/picomnew.nix
    # ./modules/stylix.nix # should this be in home manager?
    # ./modules/caironew.nix
    # ./modules/neovimnew.nix
  ];

  nix.optimise.automatic = true;

  # boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.graphics = {
    enable = true;
  };

  # might be needed for hyprland nvidia, haven't tested yet
  # boot.initrd.kernelModules = [
  #   "nvidia"
  #   "nvidia_modeset"
  #   "nvidia_uvm"
  #   "nvidia_drm"
  # ];
  # boot.extraModprobeConfig = ''
  #   options nvidia_drm modeset=1 fbdev=1
  # '';

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.graphics.enable = true;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anugrah = {
    isNormalUser = true;
    description = "Anugrah Naranatt";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  hardware.opengl = {
    package = pkgs-unstable.mesa.drivers;

    driSupport32Bit = true;
    package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim-unwrapped
    wget
    fzf
    ripgrep
    fd
    git
    gnumake
    unzip
    python3
    libgcc
    gcc
    fastfetch
    i3
    cargo
    killall
    xclip
    cbonsai
    cmatrix
    pipes
    tty-clock
    nitch
    annotator
    godot_4
    pulseaudioFull
    # volumeicon
    feh
    pfetch-rs
    inputs.zen-browser.packages."x86_64-linux".default
    file
    obsidian
    nodejs_22
    go
    lunar-client
    vim
    arandr
    usbutils
    quickemu
    # pokemon-colorscripts-mac
    wacomtablet
    simplescreenrecorder
    wpsoffice
    nixfmt-rfc-style
    prismlauncher
    mcontrolcenter
    docker
    direnv
    devenv
    scrot
    gtk3
    pwndbg
    wdisplays
    egl-wayland
    lshw
    spotify
    sshfs
    hyperfine
    pasystray
    bemoji
    xdotool
    zoom-us
    glxinfo
    libsForQt5.qt5ct
    qt6ct
    nim
    nixd
    chromium
    presenterm
    mermaid-cli
    pandoc
    typst
    presenterm-export
    davinci-resolve
    ffmpeg
    steam-run
    pwntools
    (python3.withPackages (
      ps: with ps; [
        numpy
        scikitlearn
        pwntools
      ]
    ))
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  virtualisation.multipass.enable = true;
  nix.extraOptions = ''
    trusted-users = root anugrah
  '';
  # programs.direnv.enable = true;
  virtualisation.docker.enable = true;

  # fonts.packages = with pkgs; [
  #   (nerdfonts.override {
  #     fonts = [
  #       "FiraCode"
  #       "JetBrainsMono"
  #       "SpaceMono"
  #       "Iosevka"
  #       "IosevkaTerm"
  #       "VictorMono"
  #     ];
  #   }) # find names here: https://github.com/NixOS/nixpkgs/blob/nixpkgs-unstable/pkgs/data/fonts/nerdfonts/shas.nix
  # ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.space-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.victor-mono
    poppins

  ];

  # fonts.packages = with pkgs; [noto-fonts noto-fonts-extra noto-fonts-emoji];

  services.xserver = {
    wacom.enable = true;
    enable = true;
    desktopManager = {
      gnome.enable = false; # true causes some ln symbolic link error
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager = {
      gdm.enable = true;
    };
    windowManager.i3.enable = true; # maybe try out awesomewm?
  };

  services.displayManager.defaultSession = "xfce+i3";

  hardware.enableAllFirmware = true;

  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  # environment.sessionVariables = {
  #   NIXOS_OZONE_WL = "1";
  #   WLR_NO_HARDWARE_CURSORS = "1";
  #
  # };

  programs.zsh.enable = true;
  users.users.anugrah.shell = pkgs.zsh;

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      # cairo
      cups
      curl
      dbus
      expat
      fontconfig
      freetype
      fuse3
      gdk-pixbuf
      glib
      # gtk3
      icu
      libGL
      libappindicator-gtk3
      libdrm
      libglvnd
      libnotify
      libpulseaudio
      libunwind
      libusb1
      libuuid
      libxkbcommon
      libxml2
      mesa
      nspr
      nss
      openssl
      pango
      pipewire
      stdenv.cc.cc
      systemd
      vulkan-loader
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXtst
      xorg.libxcb
      xorg.libxkbfile
      xorg.libxshmfence
      zlib
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
