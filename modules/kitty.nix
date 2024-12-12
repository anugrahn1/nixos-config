{
  config,
  pkgs,
  lib,
  ...
}:

let
  kitty = pkgs.kitty.overrideAttrs (oldAttrs: rec {
    pname = "kitty";
    version = "nightly";

    src = pkgs.fetchFromGitHub {
      owner = "kovidgoyal";
      repo = "kitty";
      rev = "refs/tags/${version}";
      hash = "sha256-e50IOkQ5dqSzJgGffb+JzJ7ZpMttUpoOO9cjxfqDavw=";
    };
    goModules =
      (pkgs.buildGoModule {
        pname = "kitty-go-modules";
        inherit src version;
        vendorHash = "sha256-XWJuCfSYIP7zH1B0sUIvko7wp06s7pTc1gOuPJuwE6Q=";
      }).goModules;

  });
in
{

  # get the font names kitty +list-fonts --psnames and pushing the settings to STDOUT and copying it here
  # make sure to restart kitty after changing font
  programs.kitty = {
    package = kitty;
    enable = true;
    catppuccin.enable = false;
    # themeFile = "Catppuccin-Mocha";
    # themeFile = lib.mkForce "Jellybeans";
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
                        include ./Jellybeans.conf
                        confirm_os_window_close 0
                        # background_opacity 0.9
                        map ctrl+shift+h previous_tab
                        map ctrl+shift+l next_tab
                        map ctrl+shift+o select_tab
                        tab_bar_style powerline
                        tab_powerline_style slanted
                        tab_bar_align center
                        tab_bar_edge top
                        # startup_session startup-file
                        # tab_bar_min_tabs 1

                        font_family      family="JetBrainsMono Nerd Font Mono"
                        bold_font        auto
                        italic_font      auto
                        bold_italic_font auto

                        font_features JetBrainsMonoNFM-Regular +calt +clig +liga +ss20 +cv02 +cv03 +cv04 +cv05 +cv06 +cv07 +cv11 +cv14 +cv15 +cv16 +cv17

                        font_size 18
                        cursor_trail 1
      scrollback_pager nvim +"source ~/.config/kitty/vi-mode.lua"
      map ctrl+h show_scrollback

      # https://www.reddit.com/r/linux/comments/re5aiy/comment/ho8n17p/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
      repaint_delay 6
    '';

    #     font_family      family="IosevkaTerm Nerd Font"
    # bold_font        auto
    # italic_font      auto
    # bold_italic_font auto 

  };
}
