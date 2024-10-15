{ config, pkgs, ... }:

{
  # get the font names kitty +list-fonts --psnames and pushing the settings to STDOUT and copying it here
  # make sure to restart kitty after changing font
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
      confirm_os_window_close 0
      background_opacity 0.9
      map ctrl+shift+h previous_tab
      map ctrl+shift+l next_tab
      map ctrl+shift+o select_tab
      tab_bar_style powerline
      tab_powerline_style slanted
      tab_bar_align center
      tab_bar_edge top
      startup_session startup-file
      tab_bar_min_tabs 1
      font_family      family="IosevkaTerm Nerd Font"
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      font_size 18
    '';
  };
}
