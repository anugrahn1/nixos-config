{ inputs, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "anugrah";
  home.homeDirectory = "/home/anugrah";

  services.mpris-proxy.enable = true; # control media using bluetooth controls

  imports = [
    ./modules/sh.nix
    ./modules/i3.nix
    ./modules/kitty.nix
    # ./modules/picom.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/zathura.nix
    ./modules/hypr.nix
    ./modules/zoxide.nix
    ./modules/btop.nix
    ./modules/yazi.nix
    ./modules/tmux.nix
    inputs.spicetify-nix.homeManagerModules.default
    ./modules/spotify.nix
    ./modules/eww.nix

    # inputs.ags.homeManagerModules.default
    # ./modules/ags.nix
  ];

  catppuccin.enable = true;

  systemd.user.startServices = true;
  # home-manager.users.anugrah.nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # pkgs.kitty

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # ".config/test/testFile" = {
    #   # source = ./picom.conf;
    #   executable = false;
    # };
    ".config/picom/picom.conf" = {
      source = ./modules/existing-dotfiles/picom/picom.conf;
      executable = false;
    };
    ".config/fastfetch/config.jsonc" = {
      source = ./modules/existing-dotfiles/fastfetch/config.jsonc;
      executable = false;
    };
    ".config/kitty/startup-file" = {
      source = ./modules/existing-dotfiles/kitty/startup-file;
      executable = false;
    };

  };
  # services.picom.enable = false;

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/anugrah/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # programs.bash = {
  #   enable = true;
  #   shellAliases = {
  #     hi = "echo HIII";
  #   };
  # };
  # allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
