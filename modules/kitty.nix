{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMonoNerdFont"; # find names with fc-list
    font.size = 16;
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
    '';
  };
}
